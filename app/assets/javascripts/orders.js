$(document).ready(function () {

  var $orders = $('.order');

  $('#order_filter_status').on('change', function() {
    var currentStatus = this.value;
    var statuses = { 0: "ordered", 1: "paid", 2: "completed", 3: "cancelled" };
    currentStatus = statuses[currentStatus]

    $orders.each(function(index, order) {
      $order = $(order);
      if ($order.data('status') == currentStatus) {
        $order.show();
      } else {
        $order.hide();
      }
    });
  });

});
