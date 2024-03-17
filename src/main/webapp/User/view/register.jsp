<%-- 
    Document   : register
    Created on : Feb 28, 2024, 4:05:36 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register form</title>
        <link rel="stylesheet" href="./assets/css/form.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .gradient-custom {

                background: #6a11cb;


                background: -webkit-linear-gradient(to right, rgb(251 95 95), rgb(243 141 186));


                background: linear-gradient(to right, rgb(251 95 95), rgb(243 141 186))
            }
        </style>
    </head>
    <body>
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">
                                <div class="mb-md-5 mt-md-4 pb-5">
                                    <h2 class="fw-bold mb-2 text-uppercase">Sign up</h2>
                                    <p></p>
                                    <br>
                                    <h2 style="color: red;">${param.message}</h2>
                                    <form action="/CWU/register" method="post">
                                        <div class="form-outline form-white mb-4 form-group">
                                            <input type="text" id="typeFullname" name="fullname" placeholder="Fullname" class="form-control form-control-lg" />
                                            <label class="form-label" for="typeEmailX"></label>
                                            <span class="message_error"></span>
                                        </div>
                                        <div class="form-outline form-white mb-4 form-group">
                                            <input type="text" id="typePhone" name="phone" placeholder="Phone" class="form-control form-control-lg" />
                                            <label class="form-label" for="typeEmailX"></label>
                                            <span class="message_error"></span>
                                        </div>
                                        <div class="form-outline form-white mb-4 form-group">
                                            <input type="text" id="typeAddress" name="address" placeholder="Address" class="form-control form-control-lg" />
                                            <label class="form-label" for="typePasswordX"></label>
                                            <span class="message_error"></span>
                                        </div>
                                        <div class="form-outline form-white mb-4 form-group">
                                            <input type="text" id="typeEmail" name="email" placeholder="Email" class="form-control form-control-lg" />
                                            <label class="form-label" for="typeEmailX"></label>
                                            <span class="message_error"></span>
                                        </div>
                                        <div class="form-outline form-white mb-4 form-group">
                                            <input type="password" id="typePassword" name="password" placeholder="Pasword" class="form-control form-control-lg" />
                                            <label class="form-label" for="typePasswordX"></label>
                                            <span class="message_error"></span>
                                        </div>
                                        <p class="small mb-5 pb-lg-2"><a class="text-white-50" href="/CWU/login">Login</a></p>
                                        <button class="btn btn-outline-light btn-lg px-5" type="submit" id="btn-res" name="btn-signup">Sign up</button>
                                    </form>
                                    <div class="d-flex justify-content-center text-center mt-4 pt-1">
                                        <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                                        <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                                        <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="./assets/js/check.js"></script>
        <script>
                                        let fullname = document.querySelector('#typeFullname'),
                                                phone = document.querySelector('#typePhone'),
                                                email = document.querySelector('#typeEmail'),
                                                password = document.querySelector('#typePassword'),
                                                address = document.querySelector('#typeAddress'),
                                                btnSubmit = document.querySelector('#btn-res');
                                        const messageEmpty = "Hãy nhập thông tin cho trường này",
 
                                                messagePhone = "Hãy nhập đúng định dạng số điện thoại";
                                        const inputsToValidateCheckInfo = [
                                             {element: password, message: messageEmpty, regex: /^.{1,}$/, type: "text", isEmpty: false},
                                              {element: email, message: messageEmpty, regex: /^.{1,}$/, type: "text", isEmpty: false},
                                            {element: address, message: messageEmpty, regex: /^.{1,}$/, type: "text", isEmpty: false},
                                            {element: phone, message: messagePhone, regex: /(84|0[3|5|7|8|9])+([0-9]{8})\b/g, type: "text", isEmpty: false},
                                            {element: fullname, message: messageEmpty, regex: /^.{1,}$/, type: "text", isEmpty: false},
                                        ];
                                        validation(inputsToValidateCheckInfo, btnSubmit);
    </script>
    </body>
</html>
