if(self!=top){top.location=self.location;}

$(document).ready(function(){
	$('.login_main').center();
	var userId=$n("loginid");
	var password=$n("password");
	if (getCookie("loginid")!= null) {
		userId.value = getCookie("loginid");
	}
	if(userId.value==""){
		userId.focus();
	}else{
		password.focus();
	}
});
//重置
function resetUser(){
	$n("loginid").value="";
	$n("password").value="";
}
//点击登录
function doLogin(){
	if(validate()){
		setCookie("loginid",$n("loginid").value);//记住用户名
		document.forms[0].submit();
	}
}
//校验
function validate(){
	var userId = $n("loginid");
	if(userId.value.trim()==""){
		alert("请输入用户名");
		userId.focus();
		return false;
	}
	var password = $n("password");
	if(password.value==""){
		alert("请输入密码");
		password.focus();
		return false;
	}
	return true;
}
function keypress(){
	if(event.keyCode==13||event.keyCode==42){
		doLogin();
	}
}
jQuery.fn.center = function(d) {
    var a = this;
    if (!d) {
        a.css("margin-top", $(window).height() / 2 - this.height() / 2);
        a.css("margin-left", $(window).width() / 2 - this.width() / 2);
        $(window).resize(function() {
            a.center(!d)
        })
    } else {
        var c = $(window).height() / 2 - this.height() / 2;
        var b = $(window).width() / 2 - this.width() / 2;
        c = (c < 0) ? 0 : c;
        b = (b < 0) ? 0 : b;
        a.stop();
        a.animate({
            marginTop: c,
            marginLeft: b
        },
        150, "linear")
    }
};