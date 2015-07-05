// var tod = document.querySelector('.time-of-day').value;
// var dow = document.querySelectorAll('.day-of-week');
// var checked = [];

// for(i = 0; i < dow.length; i++){
//   if(dow[i].checked){
//     checked.push(i);
//   }
// }

// var checked = checked.join('-');
var LB = LB || {};
LB.savedData = {};

$('.toggle li').on('click', function(e){
  var $this = $(this);
  if( $this.hasClass('selected') ){
    $this.removeClass('selected');
  } else {
    $this.addClass('selected');
  }
  checkSelected();
  updateReport();
  console.log(LB.savedData);
});

function updateReport(){
  var options = ['daysOfWeek', 'neighborhood'];
  var reports = {};
  var $reportContent = $('.report-content');
  $reportContent.each(function(i, item){
    $(item).html('');
  });
  for(i = 0; i < options.length; i++){
    var reportName = options[i]+'-report';
    if(reports[reportName] == undefined){
      reports[reportName] = [];
    }
    console.log(options[i]);
    option = LB.savedData[options[i]];
    console.log(option);
    if(option != undefined){
      for(j = 0; j < option.length; j++){
        $('.'+reportName).append('<span class="report-el">'+option[j]+'</span>');
      }
    }
  }
}

function checkSelected(){
  LB.savedData = {};
  var cat,
      $selected = $('.toggle li.selected');
  $selected.each(function(i, item){
    var $item = $(item);
    cat = $item.attr('title');
    if(LB.savedData[cat] == undefined){
      LB.savedData[cat] = [];
    }
    LB.savedData[cat].push($item.attr('name'));
  });
}

