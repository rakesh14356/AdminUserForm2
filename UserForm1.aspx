<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserForm1.aspx.cs" Inherits="AdminUserForm2.UserForm1" %>

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
            margin-top: 12px !important;
     
        }

        .row.aligement2 {
            margin-left: 81px !important;
        }

        .row.aligement3 {
            margin-left: 67px !important;
        }

        .row.aligement4 {
            margin-left: 56px !important;
        }

        .row.aligement5 {
            margin-left: 47px !important;
        }

        .row.aligement11 {
            margin-left: 4px !important;
        }

        .row.aligement6 {
            margin-left: 67px !important;
        }

        .row.aligement7 {
            margin-left: 50px !important;
        }

        .row.aligement8 {
            margin-left: 65px !important;
        }

        .row.aligement9 {
            margin-left: 15px !important;
            margin-top: 10px !important;
        }
        .row.aligement17 {
           margin-bottom: 10px !important;
           margin-top:-8px !important;
        }
         .row.aligement18 {
          
           margin-top:-8px !important;
        }
         .row.aligement19 {
          
           margin-top:-8px !important;
        }
         .alig
         {
             margin-left:20px !important;
         }
         .dvi1
         {
             margin-left:20px !important;
         }
         .row.aligement32
         {
             margin-top:-5px !important;
         }
         .aligment87
         {
             margin-left:90px !important;
         }

         
    </style>



</head>
<body>





    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">

                <form id="form1" runat="server">


                    <div class="row aligement1">
                        <asp:Label runat="server" Text="Name :">
                        </asp:Label>
                        <asp:TextBox runat="server" placeholder="Enter name " CssClass="row aligement2" ID="nmTbx" ></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="nmTbx" CssClass="dvi1" ValidationExpression="^[a-zA-Z]*$" ErrorMessage="Only contains characters" ForeColor="Red" ID="nameVal"></asp:RegularExpressionValidator>
                         <asp:RequiredFieldValidator runat="server" ErrorMessage="Name is Required" ControlToValidate="nmTbx" ForeColor="Red"></asp:RequiredFieldValidator>

                        </div>

                    <div class="row aligement32">
                        <asp:Label runat="server" Text="Email Id :"></asp:Label>
                        <asp:TextBox runat="server" TextMode="Email" placeholder="Enter Email Id " CssClass="row aligement3" ID="emlTbx"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="alig" ControlToValidate="emlTbx"  ForeColor="Red" ValidationExpression="^\S+@\S+$" ErrorMessage="Invalid email address or must contain @"></asp:RegularExpressionValidator> 
                    </div>

                    <div class="row aligement1">
                        <asp:Label runat="server" Text="Password :"></asp:Label>
                        <asp:TextBox runat="server" TextMode="Password" CssClass="row aligement4" placeholder="Enter Password" ID="TextBox1"></asp:TextBox>
                        <asp:Label runat="server" ID="lblPass" ForeColor="Red"></asp:Label>
                        <asp:RegularExpressionValidator runat="server" CssClass="alig" ErrorMessage="Size is out of Range or must contain 1 uppercase or 8 digit" ControlToValidate="TextBox1" ForeColor="Red" ValidationExpression="^(?=.*[A-Z])(?=.*[a-zA-Z0-9]).{8,}$"></asp:RegularExpressionValidator>
                    </div>

                    <div class="row aligement17">
                        <asp:Label runat="server" Text=" Confirm Password :"></asp:Label>
                        <asp:TextBox runat="server" TextMode="Password" CssClass="row aligement11" placeholder="Confirm Password" ID="TextBox6"></asp:TextBox>
                    </div>

                    <div class="row aligement1">
                        <asp:Label runat="server" Text="Contact No :"></asp:Label>
                        <asp:TextBox runat="server" placeholder="Enter Contact No" CssClass="row aligement5" ID="TextBox2"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ForeColor="Red"  CssClass="alig" ControlToValidate="TextBox2" ValidationExpression="^\d{10}$" ErrorMessage="Contact Number must be number and 10 digit"></asp:RegularExpressionValidator>
                    </div>

                    <div class="row aligement18">
                        <asp:Label runat="server" Text="PAN No :"></asp:Label>
                        <asp:TextBox runat="server" placeholder="Enter PAN No" CssClass="row aligement6" ID="TextBox3"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rgxPANCard"  runat="server" CssClass="alig"  ValidationExpression="([A-Z]){5}([0-9]){4}([A-Z]){1}$" ForeColor="Red" ControlToValidate="TextBox3" ErrorMessage="     Invalid PAN Number or must contain 5 upper 4num 1 upper format"></asp:RegularExpressionValidator>
                    </div>

                    <div class="row aligement19">
                        <asp:Label runat="server" Text="Aadhar No :"></asp:Label>
                        <asp:TextBox runat="server" placeholder="Enter Aadhar No" CssClass="row aligement7" ID="TextBox4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" C runat="server" ErrorMessage="Enter Aadhar Number And must be 12 digit" ControlToValidate="TextBox4" ValidationExpression="^\d{12}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>

                    <div class="row aligement1">
                        <asp:Label runat="server" Text="Address :"></asp:Label>
                        <asp:TextBox runat="server" placeholder="Enter Address" CssClass="row aligement8" ID="TextBox5"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Address is Required" ControlToValidate="TextBox5" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>

                    <div class="row aligement1">
                        <asp:Label runat="server" Text="User Type :" ></asp:Label>
                       
                        
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="aligment87">
                             <asp:ListItem Value="">Please Select</asp:ListItem>
                            <asp:ListItem>User</asp:ListItem>
                            <asp:ListItem>Admin</asp:ListItem>
                      
                        </asp:DropDownList>
                        
                        
                    </div>

                    <div class="row aligement1">
                        <asp:Button runat="server" Text="Register" CssClass="btn btn-primary" OnClick="RegClick" ID="Rgbtn" />
                        <asp:Button runat="server" Text="SignUp" CssClass="btn btn-primary" OnClick="SignClick" CausesValidation="false" />
                        <asp:Label runat="server" ID="lblReg" ForeColor="Red"></asp:Label>
                    </div>


                </form>
            </div>

        </div>
    </div>
</body>
</html>
