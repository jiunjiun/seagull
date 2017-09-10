# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  refresh = setInterval ->
      $.ajax
        dataType: 'json',
        url: 'price.json',
        success: (data) ->
          console.log data.maicoin[0].avg
          $('.bitoex_btc .col-md-4.text-left span').html(data.bitoex.buy)
          $('.bitoex_btc .col-md-4.text-right span').html(data.bitoex.sell)
          $('.bitoex_btc_created_at').html(data.bitoex.created_at)

          $('.maicoin_btc .col-md-4.text-left span').html(data.maicoin[0].buy)
          $('.maicoin_btc .col-md-4.text-right span').html(data.maicoin[0].sell)
          $('.maicoin_btc_created_at').html(data.maicoin[0].created_at)

          $('.maicoin_eth .col-md-4.text-left span').html(data.maicoin[1].buy)
          $('.maicoin_eth .col-md-4.text-right span').html(data.maicoin[1].sell)
          $('.maicoin_eth_created_at').html(data.maicoin[1].created_at)
    , (1000 * 50)
