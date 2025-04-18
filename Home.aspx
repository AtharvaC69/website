<%@ Page Title="" Language="C#" MasterPageFile="~/Usermaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MusicalInstrument.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>MUSICAL INSTRUMENT SYSTEM</h1>
    <hr /><br />
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="images/PP-Kids-1260x400px.jpg" alt="Los Angeles" />
    </div>

    <div class="item">
      <img src="images/PP-WebBanner-1260x400px.jpg" alt="Chicago" />
    </div>

    <div class="item">
      <img src="images/Musical-Banner-7-Proof-Ready3-1024x341.jpg" alt="New York" />
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<h2>ABSTRACT</h2>

<p>This Project report entitled as “MUSICAL INSTRUMENT SYSTEM”.Computerization is necessary to avoid complexity
     of human tasks. In Pharmacy MaintenanceSystem, we can avoid the difficulty to maintain the medicine details
     and bill and patientdetails.Manual handling of records creates many problems maintaining the records of 
    eachstudents of the department are tedious work. Generating various reports becomes tedious. 
    Toovercome the above problems, the current project is developed.</p>

<h2>ACKNOWLEDGEMENT</h2>


<p>An efficient pharmacy management system can make the work easier by giving thedetails of the medicine when 
    its name is entered. A computer gives the details of themedicine like rate of medicine, and the expiry 
    date and the row and rack location of themedicine. It becomes very difficult in big medical stores to
     handle the details of all themedicines manually, so by using this pharmacy manage system we can maintain 
    the recordsof all the medicines.</p>
    <p>
        A computerized pharmacy system developed for a health maintenance organization isdescribed. The system 
        has been operational for nearly three years. It is based on a codingscheme for all drugs in the formulary
         and prescribing information. The information is processed by a computer which generates a variety of 
        usage information.
    </p>
    <p>
        The system produces reports on frequency of drugs dispensed, number and percentageof patients obtaining 
        each drug, and age-sex distribution of patients using a particular drug.The special characteristics of a
         pharmacy as they relate to computerized systems arediscussed. System requirements, maintenance 
        procedures and cost estimates are also presented.
    </p>
    <p>
        The registration module accepts the name and password for existing user andvalidates it. For new user 
        create a account. This module will allow the user to buy and enjoythe accessibilities if they have an 
        account (User-Id & Password) .only admin can access have permission to change the password. When users
         have no account earlier they can create anaccount through admin.
    </p>
</asp:Content>
