$(document).ready(function(){
  initialize();
});

function getTimeRemaining(endtime) {
  var t = Date.parse(endtime) - Date.parse(new Date());
  var seconds = Math.floor((t / parseInt(I18n.t('one_thousand'))) %
    parseInt(I18n.t('sixty')));
  var minutes = Math.floor((t /
    parseInt(I18n.t('one_thousand')) / parseInt(I18n.t('sixty'))) %
    parseInt(I18n.t('sixty')));
  var hours = Math.floor((t / (parseInt(I18n.t('one_thousand')) *
    parseInt(I18n.t('sixty')) * parseInt(I18n.t('sixty')))) %
    parseInt(I18n.t('twenty_four')));
  return {
    'total': t,
    'hours': hours,
    'minutes': minutes,
    'seconds': seconds
  };
}

function initializeClock(id, endtime) {
  var clock = document.getElementById(id);
  examStatus =  $('#exam_status').val();
  var hoursSpan = clock.querySelector('.hours');
  var minutesSpan = clock.querySelector('.minutes');
  var secondsSpan = clock.querySelector('.seconds');

  function updateClock() {
    if(examStatus !== 'start' && examStatus !== 'testing'){
      hoursSpan.innerHTML = '00';
      minutesSpan.innerHTML = '00';
      secondsSpan.innerHTML = '00';
    }else{
      var t = getTimeRemaining(endtime);

      hoursSpan.innerHTML = ('0' + t.hours).slice(parseInt(I18n.t('negative_two')));
      minutesSpan.innerHTML = ('0' + t.minutes).slice(parseInt(I18n.t('negative_two')));
      secondsSpan.innerHTML = ('0' + t.seconds).slice(parseInt(I18n.t('negative_two')));

      if (t.total <= 0) {
        clearInterval(timeinterval);
        autoSubmit(t.total);
      }
    }
  }

  updateClock();
  var timeinterval = setInterval(updateClock, parseInt(I18n.t('one_thousand')));
}

function initialize(){
  examId = $('#exam_id').val();
  examUpdatedAt = $('#exam_updated_at').val();
  duration = $('#subject_duration').val();
  var durationInSeconds = duration*I18n.t('sixty');
  var timeStart = Date.parse(new Date(examUpdatedAt));
  var deadline = initializeDeadline(durationInSeconds, timeStart);

  initializeClock('timer', deadline);
}

function autoSubmit(total){
  setTimeout(function() {
    alert('Over time! Auto finish');
    document.show_exam.submit();
  }, parseInt(I18n.t('ten')));
}

function initializeDeadline(durationInSeconds, timeStart){
  var deadline = new Date(timeStart + (durationInSeconds) *
    parseInt(I18n.t('one_thousand')));
  if(window.performance){
    if(performance.navigation.type  == 1 ){
      var currentTimeReload = Date.parse(new Date());
      deadline = new Date(currentTimeReload +
        (durationInSeconds * parseInt(I18n.t('one_thousand')) -
        (currentTimeReload - timeStart)));
    }
  }
  return deadline;
}
