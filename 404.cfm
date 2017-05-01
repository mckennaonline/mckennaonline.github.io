<cfscript>
from = "";
if (find(";",CGI.QUERY_STRING) > 0) {
	from = ListGetAt(CGI.QUERY_STRING,2,";");
	from = Replace(from,"http://"&CGI.SERVER_NAME&":"&CGI.SERVER_PORT, "");
}


switch (from) {
	case "/admin":
	case "/admin/":
		to = "http://app.rmckenna.org/admin";
		break;
	case "/login":
	case "/login/":
		to = "http://app.rmckenna.org/login";
		break;
	case "/staff":
	case "/staff/":
		to = "http://app.rmckenna.org/staff";
		break;
	case "/program/k-8.htm":
	case "/apps/pages/montessori":
	case "/apps/pages/montessorimethod":
	case "/apps/pages/montessori/about":
	case "/apps/pages/montessori/enrollment":
		to = "/montessori.html";
		break;
	case "/onlineProgram.html":
	case "/program/index.htm":
	case "/High%20School%20Program/":
	case "/High%20School%20Program/accelerate.htm":
	case "/High%20School%20Program/aboutOnlineLearning.htm":
	case "/High%20School%20Program/ssprogram.htm":
	case "/High%20School%20Program/onlineLearning.htm":
	case "/High%20School%20Program/calendar.htm":
	case "/High%20School%20Program/contactUs.htm":
	case "/pdf/onlinepamphlet.pdf":
	case "/pdf/AboutUs.pdf":
	case "/assets/pdf/RMCHS%202009%20Curriculum.pdf":
	case "/apps/pages/online":
	case "/apps/pages/online/enrollment":
	case "/apps/pages/graduationrequirements":
		to = "/online.html";
		break;
	case "/apps/contact/":
		to = "/contact.html";
		break;
	case "/apps/news/":
	case "/apps/bbmessages/":
	case "/apps/bbmessages/show_bbm.jsp?REC_ID=97024":
		to = "/";
		break;
	case "/apps/pages/projectbasedlearning":
	case "/apps/pages/highschool/enrollment":
	case "/apps/pages/hs/about":
		to = "/oncampus.html";
		break;
	case "/apps/pages/boardmembers":
	case "/apps/pages/auditreports":
	case "/apps/pages/financialstatus":
	case "/apps/pages/charter":
		to = "/charter.html";
		break;
	case "/apps/pages/montessori/employment":
	case "/apps/pages/online/employment":
		to = "/employment.html";
		break;
	case "/pdf/OnlineHandbook.pdf":
	case "/apps/pages/online/handbook":
		to = "/onlinehandbook.html";
		break;
	case "/apps/pages/hs/handbook":
		to = "/oncampusuhandbook.html";
		break;
	default:
		to = "";
}
</cfscript>
<cfif to eq "">
	<cfheader statuscode="404" statustext="Not Found">
	Sorry, page not found.<br>
	<br>
	<script>
	setTimeout(function() {
		window.location = "/";
	},3000);
	</script>
<cfelse>
	<cflocation url="#to#" statuscode="301" addtoken="false">
</cfif>