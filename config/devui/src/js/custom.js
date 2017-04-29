$(document).ready(function(){
    $('.tooltipped').tooltip({delay: 50});
});

function loadIframeByUrl(url) {
    $('.no-data').hide();
    $('.iframe-container').show();
    $('#iframe').prop('src', url);
};

function hideIframe() {
    $('.iframe-container').hide();
    $('.no-data').show();
};