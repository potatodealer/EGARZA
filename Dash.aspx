<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="false" CodeFile="Dash.aspx.cs" Inherits="Dash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0 text-dark">MANAGEMENT</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ol>
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->
            <!-- Main content -->
            <div class="content">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Modify Data</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-plus"></i>
                                        </button>
                                    </div>
                                    <!-- /.card-tools -->
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="card bg-primary collapsed-card">
                                                <div class="card-header">
                                                    <h3 class="card-title">Business Address</h3>

                                                    <div class="card-tools">
                                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                            <i class="fas fa-plus"></i>
                                                        </button>
                                                    </div>
                                                    <!-- /.card-tools -->
                                                </div>
                                                <!-- /.card-header -->
                                                <div class="card-body">
                                                    
                                                    <div class="card card-info">
                                                        <div class="card-header">
                                                            <h3 class="card-title">Current Info</h3>
                                                        </div>
                                                        <!-- /.card-header -->
                                                        <!-- form start -->
                                                        <form class="form-horizontal">
                                                            <div class="card-body">
                                                                <div class="row" id="tblInfo">
                                                                    <div class="col">

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- /.card-body -->
                                                        </form>
                                                    </div>

                                                    <div class="card card-info">
                                                        <div class="card-header">
                                                            <h3 class="card-title">New Info</h3>
                                                        </div>
                                                        <!-- /.card-header -->
                                                        <!-- form start -->
                                                        <form class="form-horizontal">
                                                            <div class="card-body">
                                                                <div class="form-group row">
                                                                    <label class="col-sm-2 col-form-label" style="color:black;">Phone #</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="tel" class="form-control" id="txtPhoneUp" placeholder="Phone">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-sm-2 col-form-label" style="color:black;">Email</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="email" class="form-control" id="txtEmailUp" placeholder="Email">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- /.card-body -->
                                                            <div class="card-footer">
                                                                <button type="submit" class="btn btn-info" onclick="updateInfo()">Submit</button>
                                                            </div>
                                                            <!-- /.card-footer -->
                                                        </form>
                                                    </div>

                                                </div>
                                                <!-- /.card-body -->
                                            </div>
                                            <!-- /.card -->
                                        </div>

                                        <div class="col-md-6">
                                            <div class="card card-primary">
                                              <div class="card-header">
                                                <h3 class="card-title">Update Login</h3>

                                              </div>
                                          <!-- /.card-header -->
                                          <!-- form start -->
                                          <form role="form" runat="server" method="post">
                                            <div class="card-body">
                                                <label>Current Email</label>
                                                <br /><span><% =Session["user_email"] %></span><br />
                                              <div class="form-group">
                                                <label for="newEmail">New Email Address </label>
                                                <asp:TextBox ID="newEmail" CssClass="form-control" type="email" runat="server" placeholder="Enter email if you want to change email"></asp:TextBox>                    
                                              </div>
                                              <div class="form-group">
                                                <label for="currentPass">* Current Password</label>
                                                <asp:TextBox ID="currentPass" CssClass="form-control" type="password" runat="server" placeholder="Password"></asp:TextBox>
                                              </div>
                                              <div class="form-group">
                                                <label for="newPass">New Password</label>
                                                <asp:TextBox ID="newPass" CssClass="form-control" type="password" runat="server" placeholder="Enter Password if you want to change password"></asp:TextBox>
                                              </div>
                                              <div class="form-group">
                                                <label for="rePass">Retype Password</label>
                                                <asp:TextBox ID="rePass" CssClass="form-control" type="password" runat="server" placeholder="Retype New Password"></asp:TextBox>
                                              </div>
                                              <div>
                                                 <asp:Label ID="lblResponse" runat="server"></asp:Label>
                                              </div>
                                            </div>
                                            <!-- /.card-body -->
                                            <div class="card-footer">
                                              <asp:Button ID="upBtn" type="button" runat="server" CssClass="btn btn-primary btn-block" OnClick="UpdateLogin" Text="Update" />
                                            </div>
                                          </form>
                                        </div>
                                            <!-- /.card -->
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <div class="card card-warning collapsed-card">
                                <div class="card-header">
                                    <h3 class="card-title">Preview</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-plus"></i>
                                        </button>
                                    </div>
                                    <!-- /.card-tools -->
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="embed-responsive embed-responsive-16by9">
                                            <iframe src="index.html" frameborder="0" title="Preview" class="embed-responsive-item"></iframe>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <div class="card card-success collapsed-card">
                              <div class="card-header">
                                <h3 class="card-title">Messages</h3>

                                <div class="card-tools">
                                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i>
                                  </button>
                                </div>
                                <!-- /.card-tools -->
                              </div>
                              <!-- /.card-header -->
                              <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                      <div class="card card-primary card-outline">
                                        <div class="card-header">
                                          <h3 class="card-title">Inbox</h3>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body p-0">
                                          
                                          <div class="table-responsive mailbox-messages">
                                            <table id="inbox" class="table table-hover table-striped">
                                                <thead>
                                                  <tr>
                                                    <td><b>ID</b></td>
                                                    <td class="mailbox-name"><b>CLIENT NAME</b></td>
                                                    <td class="mailbox-subject"><b> EMAIL </b></td>
                                                    <td class="mailbox-subject"><b> PHONE </b></td>
                                                    <td class="mailbox-date"> <b>DATE</b></td>
                                                    <td><b>MESSAGE</b></td>
                                                  </tr>
                                                </thead>
                                              <tbody>
                                                  
                                              </tbody>
                                            </table>
                                              <!-- /.modal -->
                                            <!-- /.table -->
                                          </div>
                                          <!-- /.mail-box-messages -->
                                        </div>
                                        <!-- /.card-body -->
                                        <div class="card-footer p-0">
                                       </div>
                                      </div>
                                      <!-- /.card -->
                                    </div>
                                    <!-- /.col -->
                                  </div>
                                  <!-- /.row -->
                                <!-- /.content -->
                              </div>
                                </div>
                              </div>
                              <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                          </div>
                    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" Runat="Server">
    
</asp:Content>