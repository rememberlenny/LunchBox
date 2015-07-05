// var tod = document.querySelector('.time-of-day').value;
// var dow = document.querySelectorAll('.day-of-week');
// var checked = [];

// for(i = 0; i < dow.length; i++){
//   if(dow[i].checked){
//     checked.push(i);
//   }
// }

// var checked = checked.join('-');

var savedData = {};

$('.toggle li').on('click', function(e){
  var $this = $(this);
  if( $this.hasClass('selected') ){
    $this.removeClass('selected');
  } else {
    $this.addClass('selected');
  }
  checkSelected();
});

function checkSelected(){
  var cat,
      savedData = {},
      $selected = $('.toggle li.selected');
  $selected.each(function(i, item){
    var $item = $(item);
    cat = $item.attr('title');
    if(savedData[cat] == undefined){
      savedData[cat] = [];
    }
    savedData[cat].push($item.attr('name'));
  });
  console.log(savedData);
}

