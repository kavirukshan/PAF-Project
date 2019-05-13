<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Point Of Sales | Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="bower_components/morris.js/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">


</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="index2.html" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>P</b>OS</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>Point Of Sales</b>POS</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <!--div tag in side bar-->
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">MAIN NAVIGATION</li>
                <li >
                    <a href="index.html">
                        <i class="fa fa-fw fa-dashboard"></i> <span> Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="customer.html">
                        <i class="fa fa-fw fa-user"></i>  <span> New Customer</span>

                    </a>
                </li>
                <li class="active treeview">
                    <a href="items.html">
                        <i class="fa fa-fw fa-list-alt"></i> <span> New Item</span>

                    </a>
                </li>

                <li>
                    <a href="orders.html">
                        <i class="fa fa-fw fa-file-text-o"></i>
                        <span> New Orders</span>
                    </a>
                </li>
                <li >
                    <a href="ordersDetaial.html">
                        <i class="fa fa-fw fa-file-o"></i>
                        <span>Order Details</span>
                    </a>
                </li>
            </ul>
        </section>
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" >
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                New Item
                <small>Control panel</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">New Item</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <!-- left column -->
                <div class="col-md-4">
                    <!-- general form elements -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Add Item</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form role="form">
                            <div class="box-body">
                                <div class="box-header">
                                    <button type="button" class="btn btn-primary">New Item</button>
                                </div>
                                <div class="form-group">
                                    <label >Item Code</label>
                                    <input type="text" class="form-control" id="textItemCord" placeholder="Enter Item Code">
                                </div>
                                <div class="form-group">
                                    <label >Description</label>
                                    <input type="text" class="form-control" id="textItemName" placeholder="Enter Description">
                                </div>
                                <div class="form-group">
                                    <label >Unit Price</label>
                                    <input type="text" class="form-control" id="textItemPrice" placeholder="Enter Unit Price">
                                </div>
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input type="text" class="form-control" id="textItemQty" placeholder="Enter Quantity">
                                </div>

                            </div>
                            <!-- /.box-body -->


                            <div class="box-footer" style="text-align: left">
                                <button type="button" class="btn btn-primary" id="btnSave" style="margin-left:100px">ADD</button>
                                <button type="reset" class="btn btn-primary" style="margin-left:30px">Clear</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Item Information</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="tblItems" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>Item Code</th>
                                    <th>Description</th>
                                    <th>Unit Price</th>
                                    <th>Quantity</th>
                                    <th>Remove</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>Item Code</th>
                                    <th>Description</th>
                                    <th>Unit Price</th>
                                    <th>Quantity</th>
                                    <th>Remove</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <!-- Default to the left -->
        <p style="text-align: center"><strong>Copyright &copy; DEP 2019</strong> | dilrukshi.rajapakshe@gmial.com</p>
    </footer>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- DataTables -->
<script src="dist/js/jquery.dataTables.min.js"></script>
<script src="dist/js/dataTables.bootstrap.min.js"></script>
<script>
    var SERVER_URL = "http://localhost:3000";

    $("#btnSave").click(function(){

        if ($("#textItemCord").attr("disabled")){

            var item = {
                code: $("#textItemCord").val(),
                description: $("#textItemName").val(),
                unitPrice: $("#textItemPrice").val(),
                qtyOnHand: $("#textItemQty").val()
            };

            var ajaxConfig = {
                method: "PUT",
                url: SERVER_URL + "/api/v1/items/" + $("#textItemCord").val(),
                async: true,
                contentType: "application/json",
                data: JSON.stringify(item)
            }

            $.ajax(ajaxConfig).done(function(response,statusText,jxhr){
                alert("Updated Successfully");
                loadAllCustomers();
                $('button[type="reset"]').trigger("click");
            }).fail(function(jxhr,statusText,error){
                alert("Unable to update the Item, try again");
                console.log(error);
            });

        }else{

            var item = {
                code: $("#textItemCord").val(),
                description: $("#textItemName").val(),
                unitPrice: $("#textItemPrice").val(),
                qtyOnHand: $("#textItemQty").val()
            };

            var ajaxConfig = {
                method: "POST",
                url: SERVER_URL + "/api/v1/items/",
                async: true,
                contentType: "application/json",
                data: JSON.stringify(item)
            }

            $.ajax(ajaxConfig).done(function(response,statusText,jxhr){
                alert("Added Successfully");
                loadAllCustomers();
                $('button[type="reset"]').trigger("click");
            }).fail(function(jxhr,statusText,error){
                alert("Unable to save the Item, try again");
                console.log(error);
            });


        }

    });

    $('button[type="reset"]').click(function(){
        $("#tblItems tbody tr").removeClass("selected-row");
        $("#textItemCord").attr("disabled",false);
    });

    $(document).ready(function(){

        loadAllCustomers();

    });

    function loadAllCustomers(){

        $("#tblItems").dataTable().fnDestroy();
        $("#tblItems tbody tr").remove();

        var ajaxConfig = {
            method: "GET",
            url:SERVER_URL + "/api/v1/items",
            async: true
        };

        $.ajax(ajaxConfig).done(function(items,statusText,jxhr){

            items.forEach(function(item){
//textItemQty textItemPrice textItemName textItemCord
                var html = `<tr>
                                <td>${item.code}</td>
                                <td>${item.description}</td>
                                <td>${item.unitPrice}</td>
                                <td>${item.qtyOnHand}</td>
                                <td><button type="button" class="btn btn-success delete">Delete</button></td>
                            </tr>`;

                $("#tblItems tbody").append(html);

                $("#tblItems tbody tr").off("click");
                $("#tblItems tbody tr").click(function(){
                    $("#tblItems tbody tr").removeClass("selected-row");
                    $(this).addClass("selected-row");

                    $("#textItemCord").val($(this).find("td:first-child").text());
                    $("#textItemCord").attr("disabled",true);
                    $("#textItemName").val($(this).find("td:nth-child(2)").text());
                    $("#textItemPrice").val($(this).find("td:nth-child(3)").text());
                    $("#textItemQty").val($(this).find("td:nth-child(4)").text());

                });

                $("button.delete").off("click");
                $("button.delete").click(function(eventData){

                    eventData.stopPropagation();

                    var row = $(this).parents("tr");
                    var customerId = (row.find("td:first-child").text());

                    if (confirm("Are you sure to delete this Item?")){

                        var ajaxConfig = {
                            method : "DELETE",
                            url: SERVER_URL + "/api/v1/items/" + customerId,
                            async: true
                        }

                        $.ajax(ajaxConfig).done(function(response,statusText,jxhr){

                            $(row).remove();

                        }).fail(function(jxhr,statusText,error){

                            console.log(jxhr.responseText);

                        });

                    }
                });

            });

            $('#tblItems').DataTable({
                'paging'      : true,
                'lengthChange': false,
                'searching'   : true,
                'ordering'    : true,
                'info'        : true,
                'autoWidth'   : true,
                'pageLength'  : 5,
                language: {
                    search: "_INPUT_",
                    searchPlaceholder: "Search Items..."
                }
            });

        }).fail(function(jxhr,statusText,error){
            console.log(error);
        });


    }
</script>
</body>
</html>