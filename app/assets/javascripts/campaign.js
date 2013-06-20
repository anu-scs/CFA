$(function($){
  $.getCampaigns = function(page){
    $.ajax({
      dataType: "json",
      url: "/campaigns/get_campaigns_data",
      type: 'get',
      success: function(data){
        $.updateCampaigns(data);
      },
      complete: function(){
        $('#loading_comments').hide();
      }
    });
  }

  $.updateCampaigns = function(campaigns){
    var container = $("#portlet_tab1")
    $(campaigns).each(function(index,val){
      var items = {};
      $.each(val,function(key,value){
        items[key] = value;
      });
      $("#calls_forever_"+items['campaign_id']).html(items['calls_forever']);
      $("#calls_today_"+items['campaign_id']).html(items['calls_today']);
      $("#calls_in_progress_"+items['campaign_id']).html(items['calls_in_progress']);
      $("#total_donations_"+items['campaign_id']).html(items['total_donations']);
      
      $("#calls_remaining_"+items['campaign_id']).html(items['calls_remaining']);
      $("#calls_answered_"+items['campaign_id']).html(items['calls_answered']);
      $("#calls_interested_"+items['campaign_id']).html(items['calls_interested']);
      $("#calls_transferred_"+items['campaign_id']).html(items['calls_transferred']);
      $("#calls_recorded_"+items['campaign_id']).html(items['calls_recorded']);
      $("#left_message_"+items['campaign_id']).html(items['left_message']);
      $("#no_answer_"+items['campaign_id']).html(items['no_answer']);
    });
    
  }

  $("#search_pending_campaign_button").click(function(){
    search_text = $("#search_pending_campaign_text").val();
    $.ajax({
      dataType: "script",
      url: "/campaigns/search_pending_campaign",
      type: 'get',
      data: {keyword: search_text}
    });
  });

  $(".pull-live-stat").click(function(){
    var status = $(this).data('status');
    var campaign_id = $(this).data('campaign');
    $.ajax({
      dataType: "json",
      url: "/campaigns/get_calls_stat",
      type: 'get',
      data: {campaign_id: campaign_id, status: status},
      success: function(data){
        $.updateCallsStat(data);
      },
      complete: function(){
        $('#loading_comments').hide();
      }
    });
  });

  $.updateCallsStat = function(data){
    var container = $("#portlet_tab1")
    $(data).each(function(index,val){
      var items = {};
      $.each(val,function(key,value){
        items[key] = value;
      });
      $("#calls_remaining_"+items['campaign_id']).html(items['calls_remaining']);
      $("#calls_answered_"+items['campaign_id']).html(items['calls_answered']);
      $("#calls_interested_"+items['campaign_id']).html(items['calls_interested']);
      $("#calls_transferred_"+items['campaign_id']).html(items['calls_transferred']);
      $("#calls_recorded_"+items['campaign_id']).html(items['calls_recorded']);
      $("#left_message_"+items['campaign_id']).html(items['left_message']);
      $("#no_answer_"+items['campaign_id']).html(items['no_answer']);
    });
    
  }
})
