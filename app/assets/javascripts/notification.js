// function ready(){
//   $(document).click(function(e){
//     if( !$(e.target).is(".notification_list_cover") && !$(e.target).is(".notification_wrapper a") ){
//       if($(".notification_wrapper").hasClass("open") && !$(".notification_wrapper").hasClass("opened")){
//         $(".notification_wrapper").addClass("opened");
//       }
//       else if($(".notification_wrapper").hasClass("opened")){
//         $(".notification_wrapper").removeClass("opened").removeClass("open");
//       }
//     }
//   });

//   $(".dropdown_notification").click(function(){
//     $(this).parent().toggleClass("open");
//   });
// }
// $(document).ready(ready);
// $(document).on('page:load', ready);
$(document).on('turbolinks:load', function(){
  App.notification = App.cable.subscriptions.create(
  {channel: 'NotificationChannel', id: Cookies.get('current_user_id')}, {
  connected: function(){},
  disconnected: function(){},
  received: function(data){
    this.executeMessage(data);
  },

  /////////////////////////////
  executeMessage: function(data) {
    console.log('new notification arrived');
    $('#notifications_in_header').empty().html(data.notifications);
  }
  });
});
