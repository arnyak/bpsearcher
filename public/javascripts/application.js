function message(text, division){

if (0 != $("#message").length) $("#message").remove();

division.prepend("<div id='message' class='ui-widget-content'>" + text + "</div>");

$("#message").effect('highlight', {}, 2000);
$("#message").hide('drop', {}, 1000);

}

function json_select_with_attributes(div, id, data, attributes){

div.append("<select id='" + id+ "'></select>");
$select = $("select:last", div);

$.each(data, function(index, row) {
  $.each(row, function(entity, values) {
    first_attribute = true;
    $.each(attributes, function() {
      attribute = this;
      $.each(values, function(key, value) {
        if (attribute == key) {
          if (first_attribute) {
            option = "<option value='" + value + "'>";
            first_attribute = false;
          }
          else {
            if (null != value ) option += value + " ";
          }
        }
      });
    });
  });
  option += "</option>";
  $select.append(option);
});

}

function json_table_with_attributes(div, id, data, attributes){

div.append("<table id='" + id+ "'></table>");
$table = $("table:last", div);

var header = false;
$.each(data,function(index, row) {
  if (! header) {
    $table.append("<thead><tr></tr></thead><tbody></tbody>");
    $thead = $("thead tr", $table);
    $.each(row, function(entity, values) {
      $.each(attributes, function() {
        attribute = this;
        $.each(values, function(key, value) {
          if (attribute == key) {
            $thead.append("<th>" + key + "</th>");
          }
        });
      });
    });
    header = true;
    $tbody = $("tbody", $table);
  }
  $tbody.append("<tr></tr>");
  $tr = $("tr:last", $table);
  $.each(row, function(entity, values) {
    $.each(attributes, function() {
      attribute = this;
      $.each(values, function(key, value) {
        if (attribute == key) {
          $tr.append("<td>" + value + "</td>");
        }
      });
    });
  });
});

}

function json_table(div, id, data){

div.append("<table id='" + id+ "'></table>");
$table = $("table:last", div);

var header = false;
$.each(data,function(index, row) {
  if (! header) {
    $table.append("<thead><tr></tr></thead><tbody></tbody>");
    $thead = $("thead tr", $table);
    $.each(row, function(entity, values) {
      $.each(values, function(key, value) {
        $thead.append("<th>" + key + "</th>");
      });
    });
    header = true;
    $tbody = $("tbody", $table);
  }
  $tbody.append("<tr></tr>");
  $tr = $("tr:last", $table);
  $.each(row, function(entity, values) {
    $.each(values, function(key, value) {
      $tr.append("<td>" + value + "</td>");
    });
  });
});

}

function iconify_buttons() {

$('.filter-button').button({ icons: { primary: 'ui-icon-gear' }, text: false  });
$('.pdf-button').button({ icons: { primary: 'ui-icon-print' }, text: false  });
$('.clone-button').button({ icons: { primary: 'ui-icon-grip-solid-horizontal' }, text: false  });
$('.comment-button').button({ icons: { primary: 'ui-icon-comment' }, text: false  });
$('.new-button').button({ icons: { primary: 'ui-icon-plusthick' }, text: false  });
$('.edit-button').button({ icons: { primary: 'ui-icon-pencil' }, text: false  });
$('.delete-button').button({ icons: { primary: 'ui-icon-trash' }, text: false  });
$('.show-button').button({ icons: { primary: 'ui-icon-circle-zoomin' }, text: false  });
$('.associate-class-button').button({ icons: { primary: 'ui-icon-plusthick' }, text: false  });
$('.associate-family-button').button({ icons: { primary: 'ui-icon-plusthick' }, text: false  });
$('.associate-typeprv-button').button({ icons: { primary: 'ui-icon-plusthick' }, text: false  });

}

function activate_table(id) {

iconify_buttons();

$(".edit-button, .new-button, .show-button", id).click(function() {
  $(this).parent().parent().parent().parent().children().removeClass('edited');
  $(this).parent().parent().parent().addClass('edited');
  return true;
});

$(id).tablesorter();

ajaxLinks();

}


jQuery.ajaxSetup({ 'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")} })

function _ajax_request(url, data, callback, type, method) {
    if (jQuery.isFunction(data)) {
        callback = data;
        data = {};
    }
    return jQuery.ajax({
        type: method,
        url: url,
        data: data,
        success: callback,
        dataType: type
        });
}

jQuery.extend({
    put: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'PUT');
    },
    delete_: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'DELETE');
    }
});

jQuery.fn.submitWithAjax = function() {
  this.unbind('submit', false);
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

//Send data via get if JS enabled
jQuery.fn.getWithAjax = function() {
  this.unbind('click', false);
  this.click(function() {
    $.get($(this).attr("href"), $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

//Send data via Post if JS enabled
jQuery.fn.postWithAjax = function() { 
  this.unbind('click', false);
  this.click(function() {
    $.post($(this).attr("href"), $(this).serialize(), null, "script");
    return false;
  })

  return this;
};


jQuery.fn.putWithAjax = function() {
  this.removeAttr('onclick');
  this.unbind('click', false);
  this.click(function() {
    $.put($(this).attr("href"), $(this).serialize(), null, "script");
    return false;
  })
  return this;
};



jQuery.fn.deleteWithAjax = function() {
  this.removeAttr('onclick');
  this.unbind('click', false);
  this.click(function() {
   if(confirm("Voulez-vous vraiment supprimer cet enregistrement ?")){
    $.delete_($(this).attr("href"), $(this).serialize(), null, "script");
    return false; }
    else {return false;} 
     })
  return this;
};


//This will "ajaxify" the links
function ajaxLinks(){
    $('.ajaxForm').submitWithAjax();
    $('a.get').getWithAjax();
    $('a.post').postWithAjax();
    $('a.put').putWithAjax();
    $('a.delete').deleteWithAjax();
}

function allowednumchar(){
$("#postalcode").keypress(function(event) { 
        if (event.keyCode == 13) return;
        var key = window.event ? event.keyCode : event.which;
	var keychar = String.fromCharCode(key);
	reg = /\d/;
	return reg.test(keychar);
        
});
}

function submitform(){
   var content = "<div id='dialog' title=''><div id='progressbar' style='width:98%'></div> </div>";
                   $("#searchdiv").before(content);
                   $("#dialog").dialog({ minHeight: 40, minWidth: 550, modal: true, position: 'center', resizable: false, closeOnEscape: false, close: function(event, ui) { $(this).remove(); } });
                   $("#progressbar").progressbar({value: 100});
  }

function presskeycode(){
$("input.submitform").keyup(function(event) { 
   if (event.keyCode == 13) { $('#searchform').submit = submitform(); } });
   $("input.submitformbyclick").click(function(){$('#searchform').submit = submitform();})
}

$(document).ready(function() {

// All non-GET requests will add the authenticity token
  // if not already present in the data packet
 $(document).ajaxSend(function(event, request, settings) {
       if (typeof(window.AUTH_TOKEN) == "undefined") return;
       // IE6 fix for http://dev.jquery.com/ticket/3155
       if (settings.type == 'GET' || settings.type == 'get') return;

       settings.data = settings.data || "";
       settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(window.AUTH_TOKEN);
     });


ajaxLinks();
presskeycode();
allowednumchar();
$("#list")
	.tablesorter({widthFixed: true, widgets: ['zebra']});
//	.tablesorterPager({container: $("#pager")});

var options = {additionalFilterTriggers: [$('#quickfind1'),$('#quickfind2')]};

//$('#list').tableFilter();
iconify_buttons();

});

