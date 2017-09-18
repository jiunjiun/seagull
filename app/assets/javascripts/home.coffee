# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  refresh = setInterval ->
      $.ajax
        dataType: 'json',
        url: 'price.json',
        success: (data) ->
          $('.bitoex_btc .buy span').html(data.bitoex.buy)
          $('.bitoex_btc .sell span').html(data.bitoex.sell)
          $('.bitoex_btc_created_at').html(data.bitoex.created_at)

          $('.maicoin_btc .buy span').html(data.maicoin[0].buy)
          $('.maicoin_btc .sell span').html(data.maicoin[0].sell)
          $('.maicoin_btc_created_at').html(data.maicoin[0].created_at)

          $('.maicoin_eth .buy span').html(data.maicoin[1].buy)
          $('.maicoin_eth .sell span').html(data.maicoin[1].sell)
          $('.maicoin_eth_created_at').html(data.maicoin[1].created_at)

          # change
          # bitoex_btc_buy
          bitoex_btc_buy_day_change       = parseFloat(data.bitoex_btc_change.day.buy.change).toFixed(2)
          bitoex_btc_buy_minute_30_change = parseFloat(data.bitoex_btc_change.minute_30.buy.change).toFixed(2)

          $('.bitoex_btc .buy .day')
            .removeClass('rise')
            .removeClass('fall')
            .addClass(data.bitoex_btc_change.day.buy.status)
            .html(bitoex_btc_buy_day_change)

          $('.bitoex_btc .buy .minute_30')
            .removeClass('rise')
            .removeClass('fall')
            .addClass(data.bitoex_btc_change.day.buy.status)
            .html(bitoex_btc_buy_minute_30_change)

          # bitoex_btc_sell
          bitoex_btc_sell_day_change       = parseFloat(data.bitoex_btc_change.day.sell.change).toFixed(2)
          bitoex_btc_sell_minute_30_change = parseFloat(data.bitoex_btc_change.minute_30.sell.change).toFixed(2)

          $('.bitoex_btc .sell .day')
            .removeClass('rise')
            .removeClass('fall')
            .addClass(data.bitoex_btc_change.day.sell.status)
            .html(bitoex_btc_sell_day_change)

          $('.bitoex_btc .sell .minute_30')
            .removeClass('rise')
            .removeClass('fall')
            .addClass(data.bitoex_btc_change.day.sell.status)
            .html(bitoex_btc_sell_minute_30_change)


          # maicoin_btc_buy
          maicoin_btc_buy_day_change       = parseFloat(data.maicoin_btc_change.day.buy.change).toFixed(2)
          maicoin_btc_buy_minute_30_change = parseFloat(data.maicoin_btc_change.minute_30.buy.change).toFixed(2)

          $('.maicoin_btc .buy .day')
            .removeClass('rise')
            .removeClass('fall')
            .addClass(data.maicoin_btc_change.day.buy.status)
            .html(maicoin_btc_buy_day_change)

          $('.maicoin_btc .buy .minute_30')
            .removeClass('rise')
            .removeClass('fall')
            .addClass(data.maicoin_btc_change.minute_30.buy.status)
            .html(maicoin_btc_buy_minute_30_change)

          # maicoin_btc_sell
          maicoin_btc_sell_day_change       = parseFloat(data.maicoin_btc_change.day.sell.change).toFixed(2)
          maicoin_btc_sell_minute_30_change = parseFloat(data.maicoin_btc_change.minute_30.sell.change).toFixed(2)

          $('.maicoin_btc .sell .day')
            .removeClass('rise')
            .removeClass('fall')
            .addClass(data.maicoin_btc_change.day.sell.status)
            .html(maicoin_btc_sell_day_change)

          $('.maicoin_btc .sell .minute_30')
            .removeClass('rise')
            .removeClass('fall')
            .addClass(data.maicoin_btc_change.minute_30.sell.status)
            .html(maicoin_btc_sell_minute_30_change)


          # maicoin_eth_buy
          maicoin_eth_buy_day_change       = parseFloat(data.maicoin_eth_change.day.buy.change).toFixed(2)
          maicoin_eth_buy_minute_30_change = parseFloat(data.maicoin_eth_change.minute_30.buy.change).toFixed(2)

          $('.maicoin_eth .buy .day')
            .removeClass('rise')
            .removeClass('fall')
            .addClass(data.maicoin_eth_change.day.buy.status)
            .html(maicoin_eth_buy_day_change)

          $('.maicoin_eth .buy .minute_30')
            .removeClass('rise')
            .removeClass('fall')
            .addClass(data.maicoin_eth_change.minute_30.buy.status)
            .html(maicoin_eth_buy_minute_30_change)

          # maicoin_eth_sell
          maicoin_eth_sell_day_change       = parseFloat(data.maicoin_eth_change.day.sell.change).toFixed(2)
          maicoin_eth_sell_minute_30_change = parseFloat(data.maicoin_eth_change.minute_30.sell.change).toFixed(2)

          $('.maicoin_eth .sell .day')
            .removeClass('rise')
            .removeClass('fall')
            .addClass(data.maicoin_eth_change.day.sell.status)
            .html(maicoin_eth_sell_day_change)

          $('.maicoin_eth .sell .minute_30')
            .removeClass('rise')
            .removeClass('fall')
            .addClass(data.maicoin_eth_change.minute_30.sell.status)
            .html(maicoin_eth_sell_minute_30_change)
    , (1000 * 50)
