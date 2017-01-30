// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require js.cookie
//= require_tree .

$( document ).on('turbolinks:load', function() {
    function calculatePrice() {
        var quantity, price, sum = 0;
        $('.table-order').each(function () {
            price = $(this).children('.price').attr('data-value');
            quantity = $(this).children('.quantity').find('input').val();
            if (!isNaN(price) && !isNaN(quantity)) {
                sum += price * quantity;
            }
        });
        sum = sum.toFixed(2);
        $('#totalprice').text(sum);
    };
    calculatePrice();

    $('.table-order').on('keyup', '.quantity', function () {
        calculatePrice();
    });
});