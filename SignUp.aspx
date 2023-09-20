<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="AdminUserForm2.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title></title>
    <style>
        .row.aligement1 {
            margin-top: 20px !important;
        }
         .row.aligement4 {
            margin-top: 10px !important;
        }
        .row.aligement2
        {
            margin-left:10px !important;
        }
        .row.aligement3
        {
            margin-left:12px !important;
        }
        .row.aligment12
        {
            margin-left:60px !important;
        }
    </style>
</head>
<body>
     <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
    
        

            

                <form id="form2" runat="server" class="row aligment12">
                    

                        <div class="row aligement1">
                            <asp:Label runat="server" Text="Username :">
                            </asp:Label>
                            <asp:TextBox runat="server" placeholder="Enter name " CssClass="row aligement2" ID="nmTbx2"></asp:TextBox>
                        </div>

                        <div class="row aligement4">
                            <asp:Label runat="server" Text="Password :"></asp:Label>
                            <asp:TextBox runat="server" placeholder="Enter Password " TextMode="Password" CssClass="row aligement3" ID="emlTbx2"></asp:TextBox>
                        </div>

                    <div class="row aligement4">
                            <asp:Button runat="server"  Text="Login" CssClass="btn btn-primary" OnClick="lgnClick"  />
                        <asp:Button runat="server"  Text="SignUp" CssClass="btn btn-primary" OnClick="signUpClick"  />
                             <asp:Label runat="server" id="lblReg" ForeColor="Red"></asp:Label>
                        </div>
                    </div>
            </div>
         </div>


       
    </form>
</body>
</html>
