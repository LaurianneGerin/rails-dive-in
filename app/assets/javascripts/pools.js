// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('.input-daterange').datepicker({
  todayBtn: "linked",
  beforeShowDay: function (date){
    if (date.getMonth() == (new Date()).getMonth())
      switch (date.getDate()){
        case 4:
          return {
            tooltip: 'Example tooltip',
            classes: 'active'
          };
        case 8:
          return false;
        case 12:
          return "green";
    }
  },
  toggleActive: true,
  defaultViewDate: { year: 1977, month: 04, day: 25 }
});
