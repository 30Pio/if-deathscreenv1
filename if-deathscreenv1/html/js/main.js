


$(function () {
  function display(bool) {
      if (bool) {
          $("body").show();
      } else {
          $("body").hide();
      }
  }

  display(false)

  window.addEventListener('message', function (event) {
      var item = event.data;
      if (item.type === "ui") {
          if (item.status == true) {
              display(true)
              startTimer()
          } else {
              display(false)
              resetTimer()
          }
      }
  })    



  function startTimer() {
    let timerElement = document.getElementById('timer'),
      timer = 300,
      interval;
  
    interval = setInterval(() => {
      timer--;
  
      let minutes = Math.floor(timer / 60),
        seconds = timer % 60;
  
      timerElement.innerHTML = `${minutes}:${seconds}`;
  
      if (timer === 0) {
        clearInterval(interval);
        resetTimer()
        $.post('http://if-deathscreenv1/die', JSON.stringify({}));
      }
      document.addEventListener("keydown", (event) => {
        if (event.key === "w") {
          $.post('http://if-deathscreenv1/die', JSON.stringify({}));
          clearInterval(interval);
          resetTimer()
        }
      });
    
    }, 1000);
  }
  
  




  document.addEventListener("keydown", (event) => {
    if (event.key === "e") {
      $.post('http://if-deathscreenv1/sendDispatch', JSON.stringify({}));
    }
  });

  
  function resetTimer() {
    let timerElement = document.getElementById('timer');
    timerElement.innerHTML = '4:59';
    timer = 300;
  }


})  
