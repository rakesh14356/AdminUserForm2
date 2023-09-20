<%@ Page Language="C#" AutoEventWireup="true" enableEventValidation ="false" CodeBehind="Admin.aspx.cs" Inherits="AdminUserForm2.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title></title>
    <style>
        .row.algment1 {
            margin-left: 170px !important;
            margin-right: 150px !important;
        }

       .row.aligment2 {
            margin-left: 740px !important;
            margin-top: 5px !important;
            margin-bottom: 10px !important;
        }
        .row.aligment3
        {
            margin-top:50px !important;
            margin-left:830px !important;

        }



         .row.aligement21 {
            margin-top: 12px !important;
        }

        .row.aligement22 {
            margin-left: 81px !important;
        }

        .row.aligement23 {
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
    </style>
</head>
<body>

    
    <div class="container" runat="server" id="div1id" visible="false" >
        <div class="row">
            <div class="col-md-6 col-md-offset-3">

                <form id="form1" runat="server">


                    <div class="row aligement21">
                        <asp:Label runat="server" Text="Name :">
                        </asp:Label>
                        <asp:TextBox runat="server" placeholder="Enter name " CssClass="row aligement22" ID="nmTbx"></asp:TextBox>
                    </div>

                    <div class="row aligement21">
                        <asp:Label runat="server" Text="Email Id :"></asp:Label>
                        <asp:TextBox runat="server" TextMode="Email" placeholder="Enter Email Id " CssClass="row aligement23" ID="emlTbx"></asp:TextBox>
                    </div>

                    <div class="row aligement21">
                        <asp:Label runat="server" Text="Password :"></asp:Label>
                        <asp:TextBox runat="server" TextMode="Password" CssClass="row aligement4" placeholder="Enter Password" ID="TextBox1"></asp:TextBox>
                        
                    </div>

                   

                    <div class="row aligement21">
                        <asp:Label runat="server" Text="Contact No :"></asp:Label>
                        <asp:TextBox runat="server" placeholder="Enter Contact No" CssClass="row aligement5" ID="TextBox2"></asp:TextBox>
                       
                    </div>

                    <div class="row aligement21">
                        <asp:Label runat="server" Text="PAN No :"></asp:Label>
                        <asp:TextBox runat="server" placeholder="Enter PAN No" CssClass="row aligement6" ID="TextBox3"></asp:TextBox>
                    </div>

                    <div class="row aligement21">
                        <asp:Label runat="server" Text="Aadhar No :"></asp:Label>
                        <asp:TextBox runat="server" placeholder="Enter Aadhar No" CssClass="row aligement7" ID="TextBox4"></asp:TextBox>
                    </div>

                    <div class="row aligement21">
                        <asp:Label runat="server" Text="Address :"></asp:Label>
                        <asp:TextBox runat="server" placeholder="Enter Address" CssClass="row aligement8" ID="TextBox5"></asp:TextBox>
                    </div>

                    <div class="row aligement21">
                        <asp:Button runat="server" Text="Update" CssClass="btn btn-primary" OnClick="UpdateClick" ID="Rgbtn" />
                        <asp:Label runat="server" ID="Idlbl" Visible="false" ></asp:Label>
                      
                        <asp:Label runat="server" ID="lblReg" ForeColor="Red"></asp:Label>
                    </div>


                </form>
            </div>

        </div>
        </div>










    <form runat="server" class="row algment1" visible="true" id="divId2" >
        <div class="row aligment3">
            <asp:Label runat="server" ID="lblId" ForeColor="Purple" Font-Bold="true" Font-Size="Large"></asp:Label>
        </div>
        <div class="row aligment2">
            <asp:Button runat="server" Text="SignOut" CssClass="btn btn-primary" OnClick="BackClick" />
            <asp:Button runat="server" Text="Download In Excel" CssClass="btn btn-primary" OnClick="DwnlExl2" />
        </div>

        <div class="row">
            <div class="col-md-12">
                <asp:GridView runat="server" ID="GridView2" CssClass="table table-bordered" AutoGenerateColumns="false" DataKeyNames="ID">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email Id" />
                        <asp:BoundField DataField="Password" HeaderText="Password" />
                        <asp:BoundField DataField="ContactNo" HeaderText="Contact No" />
                        <asp:BoundField DataField="PAN" HeaderText="PAN NO" />
                        <asp:BoundField DataField="AadharNo" HeaderText="Aadhar No" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:TemplateField HeaderText="Operation">
                            <ItemTemplate>
                                <asp:LinkButton Text="Edit" runat="server" ID="EditBtn" OnClick="EditClick" ForeColor="Violet"></asp:LinkButton>
                                <asp:LinkButton Text="Delete" runat="server" ID="btnDelete" OnClick="DeleteClick" ForeColor="red"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>


                </asp:GridView>
                <asp:Label ID="lbtGrid" runat="server"></asp:Label>
            </div>
        </div>

    </form>
</body>
</html>
