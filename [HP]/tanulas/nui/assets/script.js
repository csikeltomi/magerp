// a variable for start time
var varazslat = 'ASD'
var current_varazslat =  kerdesek[varazslat]
var questions = [];
let secondsLeft = questions.length * 2;
let max_score = questions.length * 2;


//the element that displays the time
let timer = document.getElementById("timer");
let current_points = document.getElementById("current_points");

//div for high scores
let label = document.getElementById("label");
let text = document.getElementById("text");
let icon = document.getElementById("icon");

let scoresDiv = document.getElementById("scores-div");

let buttonsDiv = document.getElementById("buttons")

//button for high scores
let viewScoresBtn = document.getElementById("view-scores")

//start button div
let startButton = document.getElementById("start-button");
startButton.addEventListener("click", setTime);


// variable for the questions title
var questionDiv = document.getElementById("question-div");

// div to hold the results
let results = document.getElementById("results");

// div for the choices
var choices = document.getElementById("choices");


// an array to store high scores
let emptyArray = [];

// the array of high scores from local storage
let storedArray = JSON.parse(window.localStorage.getItem("highScores"));

// keeping track of which question we're on
var questionCount = 0;

//keeping score
let score = 0

document.addEventListener("DOMContentLoaded", function(event) {
  
});
// self executing function here


//Timer starts when the user clicks startButton (see above).
function setTime() {
  displayQuestions();
  let timerInterval = setInterval(function() {
    secondsLeft--;
    timer.textContent = "";
    timer.textContent = "Idő: " + secondsLeft;
    current_points.textContent = "Pontszám: " +score + "/ " + max_score;
    if (secondsLeft <= 0 || questionCount === questions.length) {
      clearInterval(timerInterval);
      captureUserScore();
    } 
  }, 1000);
}

function shuffle(array) {
  let currentIndex = array.length,  randomIndex;

  // While there remain elements to shuffle...
  while (currentIndex != 0) {

    // Pick a remaining element...
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex--;

    // And swap it with the current element.
    [array[currentIndex], array[randomIndex]] = [
      array[randomIndex], array[currentIndex]];
  }

  return array;
}

//function to load the questions on the page
function displayQuestions() {
  removeEls(startButton);

  if (questionCount < questions.length) {
    questionDiv.innerHTML = questions[questionCount].title;
    choices.textContent = "";
    questions[questionCount].multiChoice = shuffle(questions[questionCount].multiChoice)
    for (let i = 0; i < questions[questionCount].multiChoice.length; i++) {
      let el = document.createElement("button");
      el.innerText = questions[questionCount].multiChoice[i];
      el.setAttribute("data-id", i);
      el.addEventListener("click", function (event) {
        event.stopPropagation();

        if (el.innerText === questions[questionCount].answer) {
          score += 2;
        } else {
          //score -= 10;
          //secondsLeft = secondsLeft - 15;
        }
        
        questionDiv.innerHTML = "";

        if (questionCount === questions.length) {
          return;
        } else {
          questionCount++;
          displayQuestions();
        }
      });
      choices.append(el);
    }
    
  }
}


function captureUserScore() {
  timer.remove();
  choices.textContent = "";

  let initialsInput = document.createElement("input");
  let postScoreBtn = document.createElement("input");
  var siker = false;
  var siker_text = "Sajnos ez nem sikerült!";
  if (score >= max_score/2)
  {
    siker =true;
    $.post("https://tanulas/Siker", JSON.stringify({item : current_varazslat.item}));
    siker_text = "Gratulálok, sikeresen elsajátítottad a tudást";
  }
  results.innerHTML = `Elért ponszámod ${score}/ ${max_score} <br> ${siker_text}`;
  initialsInput.setAttribute("type", "text");
  postScoreBtn.setAttribute("type", "button");
  postScoreBtn.setAttribute("value", "Post My Score!");
  postScoreBtn.addEventListener("click", function (event) {
    event.preventDefault();
    let scoresArray = defineScoresArray(storedArray, emptyArray);

    let initials = initialsInput.value;
    let userAndScore = {
      initials: initials,
      score: score,
    };

    scoresArray.push(userAndScore);
    saveScores(scoresArray);
    displayAllScores();
    clearScoresBtn();
    goBackBtn();
    viewScoresBtn.remove();
  });
  //results.append(initialsInput);
  //results.append(postScoreBtn);
}

const saveScores = (array) => {
  window.localStorage.setItem("highScores", JSON.stringify(array));
}

const defineScoresArray = (arr1, arr2) => {
  if(arr1 !== null) {
    return arr1
  } else {
    return arr2
  }
}

const removeEls = (...els) => {
  for (let el of els) el.remove();
}

function displayAllScores() {
  removeEls(timer, startButton, results);
  let scoresArray = defineScoresArray(storedArray, emptyArray);

  scoresArray.forEach(obj => {
    let initials = obj.initials;
    let storedScore = obj.score;
    let resultsP = document.createElement("p");
    resultsP.innerText = `${initials}: ${storedScore}`;
    scoresDiv.append(resultsP);
  });
}



function clearScoresBtn() {    
  let clearBtn = document.createElement("input");
  clearBtn.setAttribute("type", "button");
  clearBtn.setAttribute("value", "Clear Scores");
  clearBtn.addEventListener("click", function(event){
    event.preventDefault();
    removeEls(scoresDiv);
    window.localStorage.removeItem("highScores");
  })
  scoresDiv.append(clearBtn)
}

function goBackBtn() {
  let backBtn = document.createElement("input");
  backBtn.setAttribute("type", "button");
  backBtn.setAttribute("value", "Go Back");
  backBtn.addEventListener("click", function(event){
    event.preventDefault();
    window.location.reload();
  })
  buttonsDiv.append(backBtn)
}


//viewScores();

//NUI

window.addEventListener("message", function (event) {
  if (event.data.action == "Display") {
     
      varazslat = event.data.magic;
      console.log(varazslat)
      current_varazslat = kerdesek[varazslat]
      questions = kerdesek[varazslat].questions
      label.innerText = current_varazslat.label;
      text.innerText = current_varazslat.text;
      secondsLeft = questions.length * 10;
      max_score = questions.length * 2;
      icon.src = "nui://esx_inventoryhud/html/img/items/"+ current_varazslat.item + ".png"
      console.log(event.data.magic)
      $('#konyv').show();
      if (event.data.test == false)
      {
        $('#TESZT').hide()
        $('#text2').html(current_varazslat.text);
      }
        
      //window.location.reload();
  }
});

$(document).keyup(function(e) {
  console.log(e.key)
  if (e.key === "Escape") { // escape key maps to keycode `27`
    $('#konyv').hide();
    window.location.reload();
    $.post("https://tanulas/Close", JSON.stringify({}));
 }
});