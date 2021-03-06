<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Payments | eBuy </title>

    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">


</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="container">
    <div class="row">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">eBuy</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="http://localhost:8080/payment.jsp">Payment</a></li>
                    <li><a href="#">Page 2</a></li>
                    <li><a href="#">Page 3</a></li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="wrapper">
                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            Payment
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Payment</li>
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
                                        <h3 class="box-title">Add Payment</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <!-- form start -->
                                    <form role="form" id="payment-form">
                                        <div class="box-body">

                                            <div class="form-group">
                                                <label>Payment ID</label>
                                                <input type="text" class="form-control" id="id"
                                                       placeholder="Payment ID" disabled>
                                            </div>
                                            <div class="form-group">
                                                <label>Item ID</label>
                                                <input type="text" class="form-control" id="item_id"
                                                       placeholder="Enter Payment ID">
                                            </div>
                                            <div class="form-group">
                                                <label>Unit Price</label>
                                                <input type="number" class="form-control" id="unitPrice"
                                                       placeholder="Enter Unit Price">
                                            </div>
                                            <div class="form-group">
                                                <label>Quantity</label>
                                                <input type="number" class="form-control" id="qtyOnHand" placeholder="Enter Quantity">
                                            </div>

                                        </div>
                                        <!-- /.box-body -->
                                        <div class="box-footer" style="text-align: left">
                                            <button type="button" class="btn btn-primary" id="btnSave" style="margin-left:100px">Save</button>
                                            <button type="reset" class="btn btn-primary" style="margin-left:30px">Clear</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="box">
                                    <div class="box-header">
                                        <h3 class="box-title">Payment Information</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <table id="payment-table" class="table table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th>Payment ID</th>
                                                <th>Item ID</th>
                                                <th>Unit Price</th>
                                                <th>Quantity</th>
                                                <th>Remove</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>

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
                    <p style="text-align: center"><strong>Copyright &copy; PAF </strong> | Group 406-G8</p>
                </footer>
            </div>
        </div>
    </div>
</div>

<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="js/jquery-3.4.1.min.js"></script>

<!-- Bootstrap 3.3.7 -->
<script src="js/bootstrap.min.js"></script>
<!-- Bootstrap bundle -->
<script src="js/bootstrap.bundle.js"></script>

<script src="js/bootstrap.bundle.min.js"></script>
<!-- FastClick -->
<script src="js/bootstrap.js"></script>
<!-- AdminLTE App -->
<script src="js/adminlte.min.js"></script>

<script>
    $(document).ready(function () {
        var SERVER_URL = "http://localhost:8080";

        $("#btnSave").click(function () {
            var item = {
                id: $("#id").val(),
                item_id: $("#item_id").val(),
                unitPrice: $("#unitPrice").val(),
                qtyOnHand: $("#qtyOnHand").val()
            };
            var ajaxConfig = {
                method: item.id?"PUT":"POST",
                url: SERVER_URL+"/api/v1/payment",
                async: true,
                contentType: "application/json",
                data: JSON.stringify(item)
            };
            $.ajax(ajaxConfig).done(function (response, statusText, jxhr) {
                alert("Insert Successfully");
                loadAllPayment();
                $("#payment-form").reset();
            }).fail(function (jxhr, statusText, error) {
                alert("Unable to update the Payment, try again");
                console.log(error);
            });
        });

        $(document).on("click",".btn-warning",function () {
            var row = $(this).closest('tr').data('payment');
            $("#id").val(row.id);
            $("#item_id").val(row.item_id);
            $("#unitPrice").val(row.unitPrice);
            $("#qtyOnHand").val(row.qtyOnHand);
        });

        $(document).on("click",".btn-danger",function () {
            var row = $(this).closest('tr').data('payment');
            var ajaxConfig = {
                method: "DELETE",
                url: SERVER_URL+"/api/v1/payment/"+row.id
            };
            $.ajax(ajaxConfig).done(function (response, statusText, jxhr) {
                alert("Delete Successfull");
                loadAllPayment();
            }).fail(function (jxhr, statusText, error) {
                alert("Unable to Delete the Payment, try again");
                console.log(error);
            });
        });

        var loadAllPayment =  function () {
            var table = $("#payment-table tbody");
            $.getJSON(SERVER_URL + "/api/v1/payment",function(data){
                table.empty();
                $.each(data,function (key, row) {
                    var tblrow = $('<tr><td>'+row.id+'</td>' +
                        '<td>'+row.item_id+'</td>' +
                        '<td>'+row.unitPrice+'</td>' +
                        '<td>'+row.qtyOnHand+'</td>' +
                        '<td class="text-center"><button class="btn btn-warning btn-sm">EDIT</button>'+
                        '&nbsp;<button class="btn btn-danger btn-sm">DEL</button></td></tr>');
                    tblrow.closest('tr').data('payment',row);
                    table.append(tblrow);
                });
            })
        };

        loadAllPayment();
    });


</script>
</body>
</html>