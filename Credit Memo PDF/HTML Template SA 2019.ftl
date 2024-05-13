<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
<head>
     <#assign companyLogo = "${companyInformation.logoUrl}" />
  	 <#assign productLogo = "${record.subsidiary.custrecord_3pl_product_logo}" />
  
    <style type="text/css">table { 
             <#if .locale == "zh_CN">
                 font-family: stsong, sans-serif;
             <#elseif .locale == "zh_TW">
                 font-family: msung, sans-serif;
             <#elseif .locale == "ja_JP">
                 font-family: heiseimin, sans-serif;
             <#elseif .locale == "ko_KR">
                 font-family: hygothic, sans-serif;
             <#elseif .locale == "ru_RU">
                 font-family: verdana;
             <#else>
                 font-family: sans-serif;
             </#if>
             font-size: 9pt;
             table-layout: fixed;
             width: 100%;
      	     border-collapse: collapse;   
      	     
         }      
         tr {
             padding: 0;
             font-size: 9pt;
           
           
         }
         td {
             padding: 0;
             font-size: 9pt;             
         }
         
         table.header td {                          
             font-size: 9pt;     
           
         }
      
      table.header tr {
        
      }
      table.header td {
        
      }
         table.footer td {
             padding: 5;
             font-size: 8pt;
         }
      
               table.footer td {
             padding: 5;
             font-size: 8pt;
         }
      
      table.billTo {
        
           margin-top: 0px;
        
      }
         table.billTo td {                          
            font-size: 9pt;     
           
           
         }
      
      table.billTo tr {
        
      }
      table.billTo td {
        
        
      }  
      
            table.summarytotal {
        
           margin-top: 2px;
        
      }
         table.summarytotal td {                          
            font-size: 9pt;     
           
           
         }
      
      table.summarytotal tr {
        
      }
      table.summarytotal td {
        
        
      }  
      
         table.itemtable{
           border-collapse: collapse;          
           border:1px solid #bfbfbf;
           margin-top: 10px;
         }

         table.itemtable th {
             padding-bottom: 1px;
             padding-top: 1px;
             padding-left: 2px;                          
             border:1px solid #bfbfbf;             
             background-color:#BDD8F6; 
             
         }
         table.itemtable td {
             padding-bottom: 2px;
             padding-top: 2px;
             padding-left: 2px;             
             border:1px solid #bfbfbf;                          
             vertical-align: middle;
         }
        
         table.body td {
             padding-top: 15px;
         }
         td.addressheader {
             font-weight: bold;
             font-size: 8pt;
             padding-top: 6px;
             padding-bottom: 2px;
         }
         td.address {
             padding-top: 0;
         }
         span.title {
             font-size: 22pt;
             font-family: Helvetica;
         }
         span.payment {
             font-size: 14pt;
             font-family: Helvetica;
         }
         
         div.remittanceSlip {
             width: 100%;
             /* To ensure minimal height of remittance slip */             
             page-break-inside: avoid;
             page-break-after: avoid;             
         }
      
      
         hr {
            width: 100%;
            color: #d3d3d3;
            background-color: #d3d3d3;
            height: 1px;
        }
   
</style>
      <macrolist>
        <macro id="nlheader">
                <table class ="header" >
                            <tr>
	           <td style="width:450px">       
                   <img src="${companyLogo}" style="float: left; margin: 0px;"/> 
                 
               </td>
	                <td align="left" valign="bottom" ><p style=" padding-bottom: 0px"> ${record.subsidiary.custrecord_3pl_accounts_details}</p></td>
               </tr>
              
              <tr>
              <td></td>
              </tr>
        
  </table>
  <table class ="header">
    
              <tr><td style="margin-left:0px"><span class="address">${record.subsidiary.legalname}</span><br /><span class="address">
      ${record.subsidiary.address.address1}
      <#if record.subsidiary.address.address2?length != 0><br /> ${record.subsidiary.address.address2} </#if>
      <#if record.subsidiary.address.address3?length != 0><br /> ${record.subsidiary.address.address3} </#if>
      <br /> ${record.subsidiary.address.city}  ${record.subsidiary.address.state}  ${record.subsidiary.address.zip}
      <br /> ${record.subsidiary.address.country}<br /><br />${record.subsidiary.custrecord_business_reg_labelling}
      </span></td>
                <td > <p style="align:center; padding-top: 5px"><span class="title"><b>Credit Memo</b></span></p> </td>
                <td align="left"><p style="margin-top: 15px;">${record.subsidiary.custrecord_3pl_sales_support_details}</p></td></tr>

	</table>
  
    <table class = "billTo">
      <tr>
      <td class="addressheader" colspan="6"><br />Bill To</td>
	</tr>
	<tr>
	<td class="address" colspan="3">${record.billaddress}</td>
    <td>&nbsp;</td>
    <td><b>Date:</b><br /><b>Customer ID:</b><br /><b>Credit Memo #</b><br /><b>PO NO.:</b><br /><b>VAT Reg. No.:</b><br /><b>Currency:</b></td>
    <td>${record.trandate}<br />${record.entity.entityid}<br />${record.tranid}<br />${record.otherrefnum}<br />${record.entity.vatregnumber}<br />${record.currency}</td>
	</tr>
  </table>
        </macro>
      
      
 <macro id="nlfooter">
            <table class="footer" style="width: 100%;border-collapse: collapse;">
              <tr style="line-height: 1px;"><td colspan="3" style="background-color:#2eb82e">&nbsp;</td></tr>
              <tr><td colspan="3"><p style="align:center"><span class="payment"><b>Payment Options</b></span></p></td></tr>
              <tr><td align="center" colspan="3">
                
               <table style="width:100%;align:center;border-collapse: collapse;"><tr>
                 
                  <#if record.currency = "ZAR">
                    <td style="border: 1px solid #bfbfbf;"><b>Pay by EFT<br />${record.subsidiary.custrecord_3pl_payment_method}</b></td></#if>
                  <#if record.currency != "ZAR">
                    <td style="border: 1px solid #bfbfbf;"><b>Pay by EFT<br />${record.subsidiary.custrecord_3pl_payment_method}</b></td></#if>

                    
                    
                </tr>
                </table>
                
              </td></tr>
              <tr><td align="center" colspan="3" ><#if productLogo?length != 0><img src="${productLogo}" style="width:40%; height:40%;"/></#if></td></tr>              
            </table>
        </macro>
    </macrolist>
  

                    <script>var w=window;if(w.performance||w.mozPerformance||w.msPerformance||w.webkitPerformance){var d=document;AKSB=w.AKSB||{},AKSB.q=AKSB.q||[],AKSB.mark=AKSB.mark||function(e,_){AKSB.q.push(["mark",e,_||(new Date).getTime()])},AKSB.measure=AKSB.measure||function(e,_,t){AKSB.q.push(["measure",e,_,t||(new Date).getTime()])},AKSB.done=AKSB.done||function(e){AKSB.q.push(["done",e])},AKSB.mark("firstbyte",(new Date).getTime()),AKSB.prof={custid:"501074",ustr:"",originlat:"0",clientrtt:"7",ghostip:"203.213.73.189",ipv6:false,pct:"10",clientip:"210.8.226.5",requestid:"15a18d81",region:"25348",protocol:"h2",blver:13,akM:"x",akN:"ae",akTT:"O",akTX:"1",akTI:"15a18d81",ai:"329458",ra:"false",pmgn:"",pmgi:"",pmp:"",qc:""},function(e){var _=d.createElement("script");_.async="async",_.src=e;var t=d.getElementsByTagName("script"),t=t[t.length-1];t.parentNode.insertBefore(_,t)}(("https:"===d.location.protocol?"https:":"http:")+"//ds-aksb-a.akamaihd.net/aksb.min.js")}</script>
                    
                    <script>var w=window;if(w.performance||w.mozPerformance||w.msPerformance||w.webkitPerformance){var d=document;AKSB=w.AKSB||{},AKSB.q=AKSB.q||[],AKSB.mark=AKSB.mark||function(e,_){AKSB.q.push(["mark",e,_||(new Date).getTime()])},AKSB.measure=AKSB.measure||function(e,_,t){AKSB.q.push(["measure",e,_,t||(new Date).getTime()])},AKSB.done=AKSB.done||function(e){AKSB.q.push(["done",e])},AKSB.mark("firstbyte",(new Date).getTime()),AKSB.prof={custid:"501074",ustr:"",originlat:"0",clientrtt:"5",ghostip:"203.213.73.189",ipv6:false,pct:"10",clientip:"210.8.226.5",requestid:"15a418e9",region:"25348",protocol:"h2",blver:13,akM:"x",akN:"ae",akTT:"O",akTX:"1",akTI:"15a418e9",ai:"329458",ra:"false",pmgn:"",pmgi:"",pmp:"",qc:""},function(e){var _=d.createElement("script");_.async="async",_.src=e;var t=d.getElementsByTagName("script"),t=t[t.length-1];t.parentNode.insertBefore(_,t)}(("https:"===d.location.protocol?"https:":"http:")+"//ds-aksb-a.akamaihd.net/aksb.min.js")}</script>
                    
                    <script>var w=window;if(w.performance||w.mozPerformance||w.msPerformance||w.webkitPerformance){var d=document;AKSB=w.AKSB||{},AKSB.q=AKSB.q||[],AKSB.mark=AKSB.mark||function(e,_){AKSB.q.push(["mark",e,_||(new Date).getTime()])},AKSB.measure=AKSB.measure||function(e,_,t){AKSB.q.push(["measure",e,_,t||(new Date).getTime()])},AKSB.done=AKSB.done||function(e){AKSB.q.push(["done",e])},AKSB.mark("firstbyte",(new Date).getTime()),AKSB.prof={custid:"501074",ustr:"",originlat:"0",clientrtt:"21",ghostip:"203.213.73.189",ipv6:false,pct:"10",clientip:"210.8.226.5",requestid:"15a74175",region:"25348",protocol:"h2",blver:13,akM:"x",akN:"ae",akTT:"O",akTX:"1",akTI:"15a74175",ai:"329458",ra:"false",pmgn:"",pmgi:"",pmp:"",qc:""},function(e){var _=d.createElement("script");_.async="async",_.src=e;var t=d.getElementsByTagName("script"),t=t[t.length-1];t.parentNode.insertBefore(_,t)}(("https:"===d.location.protocol?"https:":"http:")+"//ds-aksb-a.akamaihd.net/aksb.min.js")}</script>
                    
                    <script>var w=window;if(w.performance||w.mozPerformance||w.msPerformance||w.webkitPerformance){var d=document;AKSB=w.AKSB||{},AKSB.q=AKSB.q||[],AKSB.mark=AKSB.mark||function(e,_){AKSB.q.push(["mark",e,_||(new Date).getTime()])},AKSB.measure=AKSB.measure||function(e,_,t){AKSB.q.push(["measure",e,_,t||(new Date).getTime()])},AKSB.done=AKSB.done||function(e){AKSB.q.push(["done",e])},AKSB.mark("firstbyte",(new Date).getTime()),AKSB.prof={custid:"501074",ustr:"",originlat:"0",clientrtt:"7",ghostip:"203.213.73.189",ipv6:false,pct:"10",clientip:"210.8.226.5",requestid:"166daa7b",region:"25348",protocol:"h2",blver:13,akM:"x",akN:"ae",akTT:"O",akTX:"1",akTI:"166daa7b",ai:"329458",ra:"false",pmgn:"",pmgi:"",pmp:"",qc:""},function(e){var _=d.createElement("script");_.async="async",_.src=e;var t=d.getElementsByTagName("script"),t=t[t.length-1];t.parentNode.insertBefore(_,t)}(("https:"===d.location.protocol?"https:":"http:")+"//ds-aksb-a.akamaihd.net/aksb.min.js")}</script>
                    
                    <script>var w=window;if(w.performance||w.mozPerformance||w.msPerformance||w.webkitPerformance){var d=document;AKSB=w.AKSB||{},AKSB.q=AKSB.q||[],AKSB.mark=AKSB.mark||function(e,_){AKSB.q.push(["mark",e,_||(new Date).getTime()])},AKSB.measure=AKSB.measure||function(e,_,t){AKSB.q.push(["measure",e,_,t||(new Date).getTime()])},AKSB.done=AKSB.done||function(e){AKSB.q.push(["done",e])},AKSB.mark("firstbyte",(new Date).getTime()),AKSB.prof={custid:"501074",ustr:"",originlat:"0",clientrtt:"13",ghostip:"203.213.73.189",ipv6:false,pct:"10",clientip:"210.8.226.5",requestid:"169c1674",region:"25348",protocol:"h2",blver:13,akM:"x",akN:"ae",akTT:"O",akTX:"1",akTI:"169c1674",ai:"329458",ra:"false",pmgn:"",pmgi:"",pmp:"",qc:""},function(e){var _=d.createElement("script");_.async="async",_.src=e;var t=d.getElementsByTagName("script"),t=t[t.length-1];t.parentNode.insertBefore(_,t)}(("https:"===d.location.protocol?"https:":"http:")+"//ds-aksb-a.akamaihd.net/aksb.min.js")}</script>
                    
                    <script>var w=window;if(w.performance||w.mozPerformance||w.msPerformance||w.webkitPerformance){var d=document;AKSB=w.AKSB||{},AKSB.q=AKSB.q||[],AKSB.mark=AKSB.mark||function(e,_){AKSB.q.push(["mark",e,_||(new Date).getTime()])},AKSB.measure=AKSB.measure||function(e,_,t){AKSB.q.push(["measure",e,_,t||(new Date).getTime()])},AKSB.done=AKSB.done||function(e){AKSB.q.push(["done",e])},AKSB.mark("firstbyte",(new Date).getTime()),AKSB.prof={custid:"501074",ustr:"",originlat:"0",clientrtt:"9",ghostip:"203.213.73.189",ipv6:false,pct:"10",clientip:"210.8.226.5",requestid:"169f1580",region:"25348",protocol:"h2",blver:13,akM:"x",akN:"ae",akTT:"O",akTX:"1",akTI:"169f1580",ai:"329458",ra:"false",pmgn:"",pmgi:"",pmp:"",qc:""},function(e){var _=d.createElement("script");_.async="async",_.src=e;var t=d.getElementsByTagName("script"),t=t[t.length-1];t.parentNode.insertBefore(_,t)}(("https:"===d.location.protocol?"https:":"http:")+"//ds-aksb-a.akamaihd.net/aksb.min.js")}</script>
                    </head>
  
<body header = "nlheader" header-height="30%" footer="nlfooter" footer-height="200pt"  padding="0.5in 0.5in 0.5in 0.5in" size="Letter">

  

  
<hr />
<#if record.item?has_content>  
  <table class="itemtable"><!-- start items -->  
  <#list record.item as item>    
  <#if item_index==0>
<thead>
	<tr>	
	<th Style="align:left;width:26%" ><b>${item.description@label}</b></th>
	<th Style="align:left;width:34%" ><b>Notes</b></th>
	<th Style="align:left;width:12%" ><b>Expiry Date</b></th>
    <th  Style="align:left;width:8%" ><b>${item.quantity@label}</b></th>
	<th  Style="align:left;width:15%" ><b>Total</b></th>
    <th  Style="align:left;width:8%"><b>VAT</b></th>
	</tr>
</thead>
</#if>
    <tr>	
	<td  Style="align:left" >${item.description}</td>
	<td  Style="align:left ">${item.custcol_3pl_addditional_infor}</td>	
    <td   Style="align:left ">${item.revrecenddate}</td>
    <td    Style="align:right ">${item.quantity}</td>
      <td   Style="align:right "><#if item.custcol_1d_bundle?has_content>${item.custcol_1d_invamt?string.currency?replace("$","R")}<#else>${item.amount}</#if></td>
    <td   Style="align:right "> ${item.taxrate1}</td>
	</tr>
	</#list><!-- end items --></table>


  </#if>

  <div class="remittanceSlip">
    <hr />    
  <table class = "summarytotal">
    <tr>
	<td colspan="4">&nbsp;</td>
	<td align="right"><b>${record.subtotal@label}</b></td>
	<td align="right">${record.subtotal}</td>
	</tr>
	<tr>
	<td colspan="4">&nbsp;</td>
	<td align="right"><b>${record.taxtotal@label}</b></td>
	<td align="right">${record.taxtotal}</td>
	</tr>
	<tr>
	<td background-color="#ffffff" colspan="4">&nbsp;</td>
	<td align="right"><b>${record.total@label}</b></td>
	<td align="right">${record.total}</td>
	</tr>

  
  </table>    
    

    </div> 
    
    

  

</body>
</pdf>