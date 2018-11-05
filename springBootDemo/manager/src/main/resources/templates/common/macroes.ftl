[#ftl strip_whitespace=true]

[#macro pagination page]
    [#local range = 4]
    [#local begin = 0]
    [#local end = 0]
    [#local pageNumber = page.number]
    [#local totalPages = page.totalPages]
    [#if range gte totalPages]
        [#local begin = 0]
        [#local end = totalPages - 1]
    [#else]
        [#local avg = range/2]
        [#if (pageNumber - avg) lt begin]
            [#local begin = begin]
        [#else]
            [#local begin = pageNumber - avg ]
        [/#if]
        [#local end = begin + range ]
        [#if end gte totalPages]
            [#local end = totalPages - 1]
            [#local begin = end - range]
        [/#if]
    [/#if]

    [#if end lt 0]
        [#local end = 0]
    [/#if]

    <div class="col12">
        <form id="pageForm" class="form-inline" method="get">
            <input id="page" type="hidden" name="page" />
            <input id="sort" type="hidden" name="sort" />
            <a href="javascript:void(0);" onclick="goPage(0);">首页</a>
            [#list begin..end as i]
                [#if page.number == i]
                    <span class="selected">${(i + 1)?c}</span>
                    [#else]
                        <a href="javascript:void(0);" onclick="goPage(${i?c});">${(i + 1)?c}</a>
                [/#if]
            [/#list]
            <a href="javascript:void(0);" onclick="goPage(${(page.totalPages - 1)?c});">尾页</a>
            <span>共${(page.totalPages)?c}页，每页${(page.size)?c}条，共${(page.totalElements)?c}条</span>
            <input id="inputPage" type="number" min="1" style="width:50px;height:25px;padding:1px;"/>
            <a class="btn-mini btn-primary" style="height:22px;cursor:pointer;text-decoration:none;" onclick="goInputPage();">Go</a>
        </form>
    </div>

    <script type="text/javascript">
        var goInputPage = function () {
            if ($("#inputPage").val()) {
                goPage($("#inputPage").val() - 1);
            }
        };
        var goPage = function(page) {
            var Request = GetRequest();
            Request["page"] = page;
            var param = GeneParam(Request);

            var url = location.href.split("?")[0];
            url = url.concat("?").concat(param);
            window.location = url;
        };

        function GetRequest() {
            var url = location.search; //获取url中"?"符后的字串
            var theRequest = new Array();
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                var strs = str.split("&");
                for(var i = 0; i < strs.length; i ++) {
                    theRequest[strs[i].split("=")[0]]=(strs[i].split("=")[1]);
                }
            }
            return theRequest;
        }

        function GeneParam(request) {
            var url = "";
            var i = 0;
            for(var key in request){
                if (i != 0) {
                    url = url.concat("&");
                }
                url = url.concat(key).concat("=").concat(request[key]);
                i++;
            }
            return url;
        }
    </script>
[/#macro]

[#macro datetimePicker name id="" value="" placeholder="" style="" pattern="" classes="span10 datetime-picker" required=false readonly=true]
    [#if !id?has_content][#local id=name][/#if]
    [#if value?has_content][#local value = value?string("yyyy-MM-dd HH:mm:ss")][/#if]
    <input class="${classes}" id="${id}" name="${name}" value="${value}" type="text" [#if readonly]readonly="readonly"[/#if] [#if pattern?has_content]pattern="${pattern}"[/#if] placeholder="这里输入${placeholder}" style="${style}" [#if required]required=""[/#if]/>
[/#macro]

[#macro dateRange fromName toName fromId="" toId="" fromValue="" toValue="" placeholder=""]
    [#if !fromId?has_content][#local fromId=fromName][/#if]
    [#if !toId?has_content][#local toId=toName][/#if]
    [#if fromValue?has_content][#local fromValue = fromValue?string("yyyy-MM-dd HH:mm:ss")][/#if]
    [#if toValue?has_content][#local toValue = toValue?string("yyyy-MM-dd HH:mm:ss")][/#if]
    <div class="input-daterange input-group">
        <input id="${fromId}" type="text" class="input-sm form-control" name="${fromName}" value="${fromValue}" readonly="readonly" placeholder="开始${placeholder}" />
        <span class="input-group-addon">
            <i class="fa fa-exchange"></i>
        </span>
        <input id="${toId}" type="text" class="input-sm form-control" name="${toName}" value="${toValue}" readonly="readonly" placeholder="结束${placeholder}" />
    </div>
[/#macro]

[#macro datetimeRange fromName toName fromValue="" toValue="" format="yyyy-MM-dd HH:mm:ss" placeholder="" readonly=true required=false]
    <div class="input-daterange input-group">
        <input type="text" class="input-sm form-control datetime-picker" name="${fromName}" [#if fromValue?has_content]value="${fromValue?string(format)}"[/#if] [#if readonly]readonly="readonly"[/#if] [#if required]required=""[/#if] placeholder="开始${placeholder}" />
        <span class="input-group-addon">
            <i class="fa fa-exchange"></i>
        </span>
        <input type="text" class="input-sm form-control datetime-picker" name="${toName}" [#if toValue?has_content]value="${toValue?string(format)}"[/#if] [#if readonly]readonly="readonly"[/#if] [#if required]required=""[/#if] placeholder="结束${placeholder}" />
    </div>
[/#macro]

[#macro select name dataList classes="chosen-select form-control" id="" dataPlaceholder="请选择" value="" style="" header=true]
    [#if !id?has_content][#local id=name][/#if]
    <select class="${classes}" id="${id}" name="${name}" data-placeholder="${dataPlaceholder}" style="${style}">
        [#if header]
            <option value=""></option>
        [/#if]

        [#if dataList?has_content]
            [#list dataList as data]
                <option value="${data.value}" [#if value?has_content && data.value == value]selected[/#if]>${data.getName()}</option>
            [/#list]
        [/#if]
    </select>
[/#macro]

[#macro selectEnum name enumObj id="" dataList="" classes="chosen-select form-control" dataPlaceholder="请选择" style="vertical-align:top;width:98%;" header=true]
    [#if !id?has_content][#local id=name][/#if]
    [#if enumObj?has_content][#local enumObjValue = enumObj.value][/#if]
    <select class="${classes}" id="${id}" name="${name}" data-placeholder="${dataPlaceholder}" style="${style}">
        [#if header]
            <option value=""></option>
        [/#if]

        [#if dataList?has_content]
            [#list dataList as data]
                <option value="${data.value?c}" [#if enumObjValue?has_content && data.value == enumObjValue]selected[/#if]>${data.getName()}</option>
            [/#list]
        [/#if]
    </select>
[/#macro]

[#macro highlightEnum value compareValue class="red"]
    [#if value == compareValue]
        ${value.getName()}
    [#else]
        <div class="hidden-sm hidden-xs btn-group">
            <span class="${class}">${value.getName()}</span>
        </div>
    [/#if]
[/#macro]

[#macro errors]
    [#if bindingResult?has_content]
        [#list bindingResult as error]
            <div class="block clearfix">

                <div class="alert alert-danger no-margin">
                    <button type="button" class="close" data-dismiss="alert">
                        <i class="ace-icon fa fa-times"></i>
                    </button>
                    <i class="ace-icon fa fa-times bigger-120"></i>
                    ${error.defaultMessage!''}
                </div>
            </div>
            <div class="hr-8"></div>
        [/#list]
    [/#if]
[/#macro]

[#macro errorMsg close=true]
    [#if errorMessage?has_content]
    <div class="block clearfix">
        <div class="hr-8"></div>
        <div class="alert alert-danger no-margin">
            [#if close]
                <button type="button" class="close" data-dismiss="alert">
                    <i class="ace-icon fa fa-times"></i>
                </button>
            [/#if]
            <i class="ace-icon fa fa-times bigger-120"></i>
            ${errorMessage}
        </div>
        <div class="hr-8"></div>
    </div>
    [/#if]
[/#macro]

[#macro successMsg close=true]
    [#if successMessage?has_content]
    <div class="block clearfix">
        <div class="hr-8"></div>
        <div class="alert alert-success no-margin">
            [#if close]
                <button type="button" class="close" data-dismiss="alert">
                    <i class="ace-icon fa fa-times"></i>
                </button>
            [/#if]
            <i class="ace-icon fa fa-check green"></i>
            ${successMessage}
        </div>
        <div class="hr-8"></div>
    </div>
    [/#if]
[/#macro]

[#macro warningMsg close=true]
    [#if warningMessage?has_content]
    <div class="block clearfix">
        <div class="hr-8"></div>
        <div class="alert alert-warning no-margin">
            [#if close]
                <button type="button" class="close" data-dismiss="alert">
                    <i class="ace-icon fa fa-times"></i>
                </button>
            [/#if]
            ${warningMessage}
        </div>
        <div class="hr-8"></div>
    </div>
    [/#if]
[/#macro]


[#macro displayNumber value]
    [#if value?has_content]
        ${value?c}
    [/#if]
[/#macro]

[#macro displayDate value]
    [#if value?has_content]
        ${value?string("yyyy-MM-dd HH:mm:ss")}
    [/#if]
[/#macro]

[#macro displayMoney value multiple=100 format=",##0.00"]
    [#if value?has_content]
        ${(value/multiple)?string("${format}")}
    [/#if]
[/#macro]

[#macro displayRate value multiple=100 format="#.0"]
    [#if value?has_content]${(value*multiple)?string("${format}")}[/#if]
[/#macro]

[#macro displayPercentage value format="##.##"]
    [#if value?has_content]
        ${value?string("${format}")}
    [/#if]
[/#macro]

[#macro displaySp value format="#.00"]
    [#if value?has_content]
    ${value?string("${format}")}
    [/#if]
[/#macro]

[#macro displayHandicap value]
    [#if value?has_content]
        (${value!''})
    [/#if]
[/#macro]

[#macro inputText name id="" value="" type="text" classes="" placeholder="" pattern="" onkeyup="" required=true displayPlaceholder=true style="width:98%;"]
    [#if !id?has_content][#local id=name][/#if]
    <input class="input-sm" id="${id}" type="${type}" name="${name}" [#if onkeyup?has_content]onkeyup="${onkeyup}"[/#if] [#if value?has_content]value="${value}"[/#if] [#if classes?has_content]class="${classes}"[/#if] [#if displayPlaceholder]placeholder="${placeholder}"[/#if] [#if pattern?has_content]pattern="${pattern}"[/#if] [#if required]required=""[/#if] style="${style}"/>
[/#macro]

[#macro inputMoney name value multiple=100 placeholder="" required=true displayPlaceholder=true pattern="^(\\d+|[1-9])(.\\d{0,2})?$"]
    [#if value?has_content]
        <input class="input-sm" type="text" [#if pattern?has_content]pattern="${pattern}"[/#if] name="${name}" value="${(value/multiple)?string("0.##")}" [#if displayPlaceholder]placeholder="这里输入${placeholder}"[/#if] [#if required]required=""[/#if] style="width:98%;"/>
    [#else]
        <input class="input-sm" type="text" [#if pattern?has_content]pattern="${pattern}"[/#if] name="${name}" [#if displayPlaceholder]placeholder="这里输入${placeholder}"[/#if] [#if required]required=""[/#if] style="width:98%;"/>
    [/#if]
[/#macro]

[#macro inputPercentage name value placeholder="" required=true displayPlaceholder=true pattern="^\\d{0,2}(.\\d{0,2})?$"]
    [#if value?has_content]
        <input class="input-sm" type="text" [#if pattern?has_content]pattern="${pattern}"[/#if] name="${name}" value="${value?string("0.##")}" [#if displayPlaceholder]placeholder="这里输入${placeholder}"[/#if] [#if required]required=""[/#if] style="width:98%;"/>
    [#else]
        <input class="input-sm" type="text" [#if pattern?has_content]pattern="${pattern}"[/#if] name="${name}" [#if displayPlaceholder]placeholder="这里输入${placeholder}"[/#if] [#if required]required=""[/#if] style="width:98%;"/>
    [/#if]
[/#macro]

[#macro inputNumber name value type="number" placeholder="" max="" min="" required=true displayPlaceholder=true]
    [#if value?has_content]
        <input class="input-sm" type="${type}" name="${name}" value="${value?c}" max="${max}" min="${min}" [#if displayPlaceholder]placeholder="${placeholder}"[/#if] [#if required]required=""[/#if] style="width:98%;"/>
    [#else]
        <input class="input-sm" type="${type}" name="${name}" max="${max}" min="${min}" [#if displayPlaceholder]placeholder="${placeholder}"[/#if] [#if required]required=""[/#if] style="width:98%;"/>
    [/#if]
[/#macro]

[#macro addTrend value type]
    [#if type?has_content]
        [#if type == "TREND_DOWN"]
            <td class='center'>[#if value?has_content]${value}↓[#else][/#if]</td>
            [#elseif type == "TREND_UP"]
            <td class='center'>[#if value?has_content]${value}↑[#else][/#if]</td>
            [#elseif type == "TREND_EQUAL"]
            <td class='center'>[#if value?has_content]${value}[#else][/#if]</td>
            [#else]
            <td class='center'>[#if value?has_content]${value}[#else][/#if]</td>
        [/#if]
    [/#if]
[/#macro]

[#macro displayTrendType value type]
    [#if type?has_content]
        [#if type == "TREND_DOWN"]
            [#if value?has_content]${value?string("#.00")}↓[#else][/#if]
        [#elseif type == "TREND_UP"]
            [#if value?has_content]${value?string("#.00")}↑[#else][/#if]
        [#elseif type == "TREND_EQUAL"]
            [#if value?has_content]${value?string("#.00")}[#else][/#if]
        [#else]
            [#if value?has_content]${value?string("#.00")}[#else][/#if]
        [/#if]
    [/#if]
[/#macro]

[#-- page macroes start --]

[#macro pageHead column="col-xs-12"]
    <!DOCTYPE html>
    <html>
        <head>
            [#include "${ctx}/common/head.ftl"/]
        </head>
        <body class="no-skin">
            <div class="main-container" id="main-container">
                <div class="main-content">
                    <div class="main-content-inner">
                        <div class="page-content">
                            <div class="row">
                                <div class=${column}>
[/#macro]

[#macro pageFoot]
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        [#include "${ctx}/common/footer.ftl"/]
    </html>
[/#macro]

[#macro editPage action="" elements=[] hiddens=[] numHiddens=[]]
    [@pageHead/]

    <form action="${ctx}${action}" method="post">
        [@macro.errors /]
        [@macro.errorMsg  close=false/]
        [#if hiddens?has_content]
            [#list hiddens as hidden]
                [@macro.inputText type="hidden" name=hidden.name value=hidden.value!'' /]
            [/#list]
        [/#if]
        [#if numHiddens?has_content]
            [#list numHiddens as numHidden]
                <input type="hidden" name="${numHidden.name}" value="${numHidden.value?c}"/>
            [/#list]
        [/#if]
        <table class="table table-striped table-bordered table-hover" id="table">
            [#list elements as element]
                <tr>
                    <td style="width:40%;text-align: right;padding-top: 13px;">${element.desc}</td>
                    <td style="padding-top:13px;">
                        [#if element.type?has_content]
                            [#switch element.type]
                                [#case 'number']
                                    [@macro.inputNumber name=element.name value=element.value!'' placeholder=element.placeholder required=element.required!true /]
                                    [#break]
                                [#case 'datetime']
                                    [@macro.datetimePicker name=element.name value=element.value!'' placeholder=element.placeholder required=element.required!true /]
                                    [#break]
                                [#case 'money']
                                    [@macro.inputMoney name=element.name value=element.value!'' placeholder=element.placeholder required=element.required!true /]
                                    [#break]
                                [#case 'percentage']
                                    [#break]
                                [#case 'select']
                                    <select name="${element.name}" class="chosen-select form-control">
                                        [#list element.options as option]
                                            <option value="${option.id?c}" [#if element.value?has_content && element.value == option.id]selected[/#if]>${option.name}</option>
                                        [/#list]
                                    </select>
                                    [#break]
                                [#case 'event']
                                    <select name="${element.name}" class="chosen-select form-control" [#if element.disabled?has_content && element.disabled]disabled[/#if]>
                                        [#list element.options as option]
                                            <option value="${option.id?c}" [#if element.value?has_content && element.value == option.id]selected[/#if]>${option.title}</option>
                                        [/#list]
                                    </select>
                                    [#break]
                                [#case 'enum']
                                    [@macro.selectEnum name=element.name enumObj=element.value!element.dataList[0] dataList=element.dataList header=false /]
                                    [#break]
                                [#case 'checkBoxEnum']
                                    [@macro.checkBoxEnum name=element.name enumObjList=element.value!element.dataList[0] dataList=element.dataList /]
                                    [#break]
                                [#default]
                                    [#if element.display?? && element.display]
                                        ${element.value!''}
                                    [#else]
                                        [@inputText name=element.name value=element.value placeholder=element.placeholder!'' required=element.required!true /]
                                    [/#if]
                            [/#switch]
                        [#elseif element.display?? && element.display]
                            ${element.value!''}
                        [#else]
                            [@inputText name=element.name value=element.value placeholder=element.placeholder!'' required=element.required!true /]
                        [/#if]
                    </td>
                </tr>
            [/#list]
        </table>

        <div class="page-header position-relative">
            <table style="width:100%;">
                <tr>
                    <td style="text-align:center;">
                        <button class="btn btn-mini btn-primary" type="submit">保存</button>
                        <button class="btn btn-mini btn-danger" type="button" onclick="top.Dialog.close();">取消</button>
                    </td>
                </tr>
            </table>
        </div>
    </form>

    [@pageFoot/]
[/#macro]

[#macro viewPage elements=[]]
    [@pageHead/]

    <table class="table table-striped table-bordered table-hover">
        [#list elements as element]
            <tr>
                <td style="width:40%;text-align:right;padding-top:13px;">${element.desc!''}</td>
                <td [#if element.contentStyle?has_content]style="${element.contentStyle}"[#else]style="padding-top:13px;"[/#if]>
                    [#if element.type?has_content]
                        [#switch element.type]
                            [#case 'number']
                                [@macro.displayNumber value=element.value!''/]
                                [#break]
                            [#case 'datetime']
                                [@macro.displayDate value=element.value!''/]
                                [#break]
                            [#case 'money']
                                [@macro.displayMoney value=element.value!''/]
                                [#break]
                            [#case 'percentage']
                                [#break]
                            [#default]
                                ${element.value!''}
                        [/#switch]
                    [#else]
                        ${element.value!''}
                    [/#if]
                </td>
            </tr>
        [/#list]
    </table>

    [@pageFoot/]
[/#macro]

[#-- page macroes end --]

[#macro subString value limit hasDot][#if value?? && value?length> limit]${value[0..limit]}[#if hasDot]...[/#if][#else]${value}[/#if][/#macro]

[#macro selectEnumNotNum name enumObj id="" dataList="" classes="chosen-select form-control" dataPlaceholder="请选择" style="vertical-align:top;width:98%;" header=true]
    [#if !id?has_content][#local id=name][/#if]
    [#if enumObj?has_content][#local enumObjValue = enumObj.value][/#if]
<select class="${classes}" id="${id}" name="${name}" data-placeholder="${dataPlaceholder}" style="${style}">
    [#if header]
        <option value=""></option>
    [/#if]

    [#if dataList?has_content]
        [#list dataList as data]
            <option value="${data.value}" [#if enumObjValue?has_content && data.value == enumObjValue]selected[/#if]>${data.getName()}</option>
        [/#list]
    [/#if]
</select>
[/#macro]


[#macro radioEnum name enumObj id="" dataList="" delete=""]
    [#if !id?has_content][#local id=name][/#if]
    [#if enumObj?has_content][#local enumObjValue = enumObj.value][/#if]
    [#if delete?has_content][#local deleteValue = delete.value][/#if]

    [#if dataList?has_content]
        [#list dataList as data]
            [#if !deleteValue?has_content || data.value != deleteValue]
                ${data.getName()}&nbsp;<input type="radio" name="${name}" value="${data.value}" [#if enumObjValue?has_content && data.value == enumObjValue]checked[/#if]>&nbsp;&nbsp;&nbsp;
            [/#if]
        [/#list]
    [/#if]
[/#macro]


[#macro checkBoxEnum name enumObjList id="" dataList="" split="" allCheckBoxName="" titleName=""]
    [#if !id?has_content][#local id=name][/#if]
    [#if dataList?has_content]

    <div  class="checkbox">
        [#if allCheckBoxName?has_content]
            [#if titleName?has_content]
                <label>
                    <span class="lbl">${titleName}&nbsp;&nbsp;&nbsp;&nbsp;</span>
                </label>
            [/#if]
            <label>
                <input type="checkbox" name="${allCheckBoxName}" class="ace" value="">
                <span class="lbl">全选</span>
            </label>
        [/#if]
    [#list dataList as data]
                 <label>
                <input name="${name}" type="checkbox" class="ace" value="${data.value?c}"
                       [#if enumObjList?has_content && enumObjList?seq_contains(data)]
                            checked
                       [/#if]>
                <span class="lbl">${data.getName()}</span>
                </label>
            [#if split?has_content && (data_index + 1)% split ==0] <br> [/#if]
    [/#list]
    </div>
    [/#if]
[/#macro]


[#macro moneyFormmat value divisor=100]
    [#if value?has_content]
        ${(value?c?number/divisor?c?number)?string('0.00')}元
    [/#if]
[/#macro]

[#macro moneyFormmatWithOutYuan value divisor=100]
    [#if value?has_content]
    ${(value?c?number/divisor?c?number)?string('0.00')}
    [/#if]
[/#macro]
