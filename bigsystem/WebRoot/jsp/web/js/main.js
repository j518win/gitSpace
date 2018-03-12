window.alert = function(msg){
			$.messager.show({
					title:'提示',
					msg:msg
				});
		}
		
		var indexTitle = "概览";
		function loadMenu(){
			$("#tree").tree({   
                checkbox: false,   
                url: '/monitor/menu/getPermissionList.do?pid=0',   
                onBeforeExpand:function(node,param){
                    $('#tree').tree('options').url = "/monitor/menu/getPermissionList.do?pid=" + node.id;// change the url                       
	                },  
	             onLoadSuccess:function(){
	       	    	 stopProgress();
	       	     },
               onClick:function(node){             
                   var url = node.attributes.url; 
                   if(node.attributes.hasChild == "0")
	                    openTab(node.text,url);
                   else
                   	$('#tree').tree(node.state == 'closed' ? 'expand' : 'collapse',node.target);
	               },
	            onDblClick: function(node){
					    $('#tree').tree(node.state == 'closed' ? 'expand' : 'collapse',node.target);
				}
          }); ;
		}
		
		function loadStrusData(){
			startProgress();
			$.get("/monitor/strus/initArmStrus.do",function(data){
				//alert(data);
				if(data='inited'){
					alert("系统数据已经初始化完毕");
				}else if(data.indexOf("success")){
					alert("系统数据初始化成功");
				}
				stopProgress();
			});
		}
		
		
		

	function openTab(title, url) {
		var tab = $('#tt').tabs('exists', title);
		if (tab) {
			//若存在，则直接打开
			$('#tt').tabs('select', title);
		} else {
			//否则创建
			$('#tt')
					.tabs(
							'add',
							{
								title : title,
								content : "<iframe width='100%' height='100%'  id='iframe' frameborder='0' scrolling='auto'  src='"
										+ url + "'>__tag_68$1101_",
								closable : true
							});
		}
	}

	function remove() {
		var tab = $('#tt').tabs('getSelected');
		if (tab) {
			var index = $('#tt').tabs('getTabIndex', tab);
			$('#tt').tabs('close', index);
		}
	}

	/**
		右键关闭菜单方法
	**/
	function tabCloseEven(e, title) {
		e.preventDefault();
		
	    $("#closeMenu").menu({
	        onClick: function (item) {
	        	closeTab(item.id);
	        }
	    });
	    $("#closeMenu").menu('show',{
			left: e.pageX,
			top: e.pageY
		});
	    
	    return false;
	}
	
	function closeTab(action)
	{
	    var alltabs = $('#tt').tabs('tabs');
	    var currentTab =$('#tt').tabs('getSelected');
	    var allTabtitle = [];
	    $.each(alltabs,function(i,n){
	        allTabtitle.push($(n).panel('options').title);
	    });

	    switch (action) {
	        case "close":
	            var currtab_title = currentTab.panel('options').title;
	          //  if (currtab_title=="welcome")break;
	            $('#tt').tabs('close', currtab_title);
	            break;
	        case "closeall":
	            $.each(allTabtitle, function (i, n) {
	                if (n != indexTitle){
	                    $('#tt').tabs('close', n);
	                }
	            });
	            break;
	        case "closeother":
	            var currtab_title = currentTab.panel('options').title;
	            $.each(allTabtitle, function (i, n) {
	                if (n != currtab_title && n != indexTitle)
	                {
	                    $('#tt').tabs('close', n);
	                }
	            });
	            break;
	        case "closeright":
	            var tabIndex = $('#tt').tabs('getTabIndex', currentTab);

	            if (tabIndex == alltabs.length - 1){
	                alert('亲，后边没有啦 ^@^!!');
	                return false;
	            }
	            $.each(allTabtitle, function (i, n) {
	                if (i > tabIndex) {
	                    if (n != indexTitle){
	                        $('#tt').tabs('close', n);
	                    }
	                }
	            });

	            break;
	        case "closeleft":
	            var tabIndex = $('#tt').tabs('getTabIndex', currentTab);
	            if (tabIndex == 1) {
	                //alert('亲!!');
	                return false;
	            }
	            $.each(allTabtitle, function (i, n) {
	                if (i < tabIndex) {
	                    if (n != indexTitle){
	                        $('#tt').tabs('close', n);
	                    }
	                }
	            });

	            break;
	        case "exit":
	            $('#closeMenu').menu('hide');
	            break;
	    }
	}
	