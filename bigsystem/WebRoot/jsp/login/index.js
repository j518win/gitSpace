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
//����
function resetUser(){
	$n("loginid").value="";
	$n("password").value="";
}
//�����¼
function doLogin(){
	if(validate()){
		setCookie("loginid",$n("loginid").value);//��ס�û���
		document.forms[0].submit();
	}
}
//У��
function validate(){
	var userId = $n("loginid");
	if(userId.value.trim()==""){
		alert("�������û���");
		userId.focus();
		return false;
	}
	var password = $n("password");
	if(password.value==""){
		alert("����������");
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