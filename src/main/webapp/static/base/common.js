
$(function(){
    contentResize();
    window.onresize = function(){
        contentResize();
    }
});
/**
 * 样式调整
 */
function contentResize(){
    $(".layui-tab-content").height($("#left-menu").outerHeight());
}