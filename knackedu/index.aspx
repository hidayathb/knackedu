<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="knackedu.index"
    MasterPageFile="~/beforelogin.Master" %>

<asp:Content ContentPlaceHolderID="CPContent" runat="server">
    <title>:: Knackedu :: My GradeBook</title>
    <!-- slider --->
    <section class="slider-section">
        <div class="tp-banner-container">
            <div class="tp-banner">
                <ul>
                    <li data-transition="slidevertical" data-slotamount="1" data-masterspeed="500" data-thumb="upload/slider_01.jpg" data-saveperformance="off" data-title="Slide">
                        <img src="upload/slider_01.jpg" alt="fullslide1" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
                        <div class="tp-caption text-center skewfromleft randomrotateout tp-resizeme"
                            data-x="center"
                            data-y="165"
                            data-speed="1000"
                            data-start="800"
                            data-easing="Power3.easeInOut"
                            data-splitin="none"
                            data-splitout="none"
                            data-elementdelay="0.1"
                            data-endelementdelay="0.1"
                            data-endspeed="1000"
                            style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
                            <img src="upload/slider_logo_01.png" alt="">
                        </div>
                        <div class="tp-caption slider_01 text-center skewfromright randomrotateout tp-resizeme"
                            data-x="center"
                            data-y="240"
                            data-speed="1000"
                            data-start="1400"
                            data-easing="Power3.easeInOut"
                            data-splitin="none"
                            data-splitout="none"
                            data-elementdelay="0.1"
                            data-endelementdelay="0.1"
                            data-endspeed="1000"
                            style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
                        </div>
                        <div class="tp-caption slider_02 text-center skewfromright randomrotateout tp-resizeme"
                            data-x="center"
                            data-y="330"
                            data-speed="1000"
                            data-start="1400"
                            data-easing="Power3.easeInOut"
                            data-splitin="none"
                            data-splitout="none"
                            data-elementdelay="0.1"
                            data-endelementdelay="0.1"
                            data-endspeed="1000"
                            style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
                        </div>
                        <div class="tp-caption slider_03 text-center randomrotateout tp-resizeme"
                            data-x="center"
                            data-y="395"
                            data-speed="1000"
                            data-start="1400"
                            data-easing="Power3.easeInOut"
                            data-splitin="none"
                            data-splitout="none"
                            data-elementdelay="0.1"
                            data-endelementdelay="0.1"
                            data-endspeed="1000"
                            style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
                    </li>
                    <li data-transition="slidevertical" data-slotamount="1" data-masterspeed="500" data-thumb="upload/slider_02.jpg" data-saveperformance="off" data-title="Slide">
                        <img src="upload/slider_02.jpg" alt="fullslide1" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
                        <div class="tp-caption slider_01 text-left skewfromright randomrotateout tp-resizeme"
                            data-x="left"
                            data-y="240"
                            data-speed="1000"
                            data-start="1400"
                            data-easing="Power3.easeInOut"
                            data-splitin="none"
                            data-splitout="none"
                            data-elementdelay="0.1"
                            data-endelementdelay="0.1"
                            data-endspeed="1000"
                            style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
                        </div>
                        <div class="tp-caption slider_02 text-center skewfromright randomrotateout tp-resizeme"
                            data-x="left"
                            data-y="330"
                            data-speed="1000"
                            data-start="1400"
                            data-easing="Power3.easeInOut"
                            data-splitin="none"
                            data-splitout="none"
                            data-elementdelay="0.1"
                            data-endelementdelay="0.1"
                            data-endspeed="1000"
                            style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
                        </div>
                        <div class="tp-caption slider_03 text-left randomrotateout tp-resizeme"
                            data-x="left"
                            data-y="395"
                            data-speed="1000"
                            data-start="1400"
                            data-easing="Power3.easeInOut"
                            data-splitin="none"
                            data-splitout="none"
                            data-elementdelay="0.1"
                            data-endelementdelay="0.1"
                            data-endspeed="1000"
                            style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
                        </div>

                    </li>

                </ul>
            </div>
        </div>
    </section>

    <section class="section-white">
        <div class="container">
            <div class="relative">
                <div class="background service-absolute">
                    <div class="row">
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="service-style-1">
                                <div class="icon-normal wow fadeIn" data-wow-duration="1s" data-wow-delay="0.2s">
                                    <i class="icon icon-Book"></i>
                                </div>
                                <!-- end icon-wrap -->
                                <div class="title-wrap">
                                    <h5 class="service-title">My Gradebook</h5>
                                    <hr>
                                    <p>it's simple, powerful and effective School Management Software for Schools.</p>
                                </div>
                                <!-- end title-wrap -->
                            </div>
                            <!-- end title -->
                        </div>
                        <!-- end col -->

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="service-style-1">
                                <div class="icon-normal wow fadeIn" data-wow-duration="1s" data-wow-delay="0.4s">
                                    <i class="icon icon-Users"></i>
                                </div>
                                <!-- end icon-wrap -->
                                <div class="title-wrap">
                                    <h5 class="service-title">School Fee Counter</h5>
                                    <hr>
                                    <p>Meet SchoolFeecounter it's an easy to use, effective and powerful Fee Management Software for Schools</p>
                                </div>
                                <!-- end title-wrap -->
                            </div>
                            <!-- end title -->
                        </div>
                        <!-- end col -->

                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="service-style-1">
                                <div class="icon-normal wow fadeIn" data-wow-duration="1s" data-wow-delay="0.6s">
                                    <i class="icon icon-MessageLeft"></i>
                                </div>
                                <!-- end icon-wrap -->
                                <div class="title-wrap">
                                    <h5 class="service-title">My School SMS</h5>
                                    <hr>
                                    <p>MyschoolSMS is the premium product of Myclassboard connect</p>
                                </div>
                                <!-- end title-wrap -->
                            </div>
                            <!-- end title -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->
                </div>
                <!-- end background service-absolute -->
            </div>
            <!-- end relative -->
        </div>
        <!-- end container -->

        <div class="container">

            <div class="col-md-12">
                <div class="section-title text-center">
                    <br />
                    <h4>Smart Schools</h4>
                    <hr>
                </div>
                <!-- end title -->
            </div>
            <!-- end col -->


            <div class="row section-container">
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="service-style-1 wow fadeIn" data-wow-duration="1s" data-wow-delay="0.2s">
                        <div class="icon-wrap">
                            <i class="fa fa-book"></i>
                        </div>
                        <!-- end icon-wrap -->
                        <div class="title-wrap">
                            <h5 class="service-title">Library</h5>
                            <hr>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiing elit. Integer lorem quam, adipiscing vel condimentum tristique. <a href="#">Read More</a></p>
                        </div>
                        <!-- end title-wrap -->
                    </div>
                    <!-- end title -->
                </div>
                <!-- end col -->

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="service-style-1 wow fadeIn" data-wow-duration="1s" data-wow-delay="0.3s">
                        <div class="icon-wrap">
                            <i class="fa fa-bus"></i>
                        </div>
                        <!-- end icon-wrap -->
                        <div class="title-wrap">
                            <h5 class="service-title">Transport</h5>
                            <hr>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiing elit. Integer lorem quam, adipiscing vel condimentum tristique. <a href="#">Read More</a></p>
                        </div>
                        <!-- end title-wrap -->
                    </div>
                    <!-- end title -->
                </div>
                <!-- end col -->

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="service-style-1 wow fadeIn" data-wow-duration="1s" data-wow-delay="0.4s">
                        <div class="icon-wrap">
                            <i class="fa fa-cubes"></i>
                        </div>
                        <!-- end icon-wrap -->
                        <div class="title-wrap">
                            <h5 class="service-title">Inventory</h5>
                            <hr>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiing elit. Integer lorem quam, adipiscing vel condimentum tristique. <a href="#">Read More</a></p>
                        </div>
                        <!-- end title-wrap -->
                    </div>
                    <!-- end title -->
                </div>
                <!-- end col -->

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="service-style-1 wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s">
                        <div class="icon-wrap">
                            <i class="fa fa-graduation-cap"></i>
                        </div>
                        <!-- end icon-wrap -->
                        <div class="title-wrap">
                            <h5 class="service-title">Pre-Admissions</h5>
                            <hr>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiing elit. Integer lorem quam, adipiscing vel condimentum tristique. <a href="#">Read More</a></p>
                        </div>
                        <!-- end title-wrap -->
                    </div>
                    <!-- end title -->
                </div>
                <!-- end col -->

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="service-style-1 wow fadeIn" data-wow-duration="1s" data-wow-delay="0.6s">
                        <div class="icon-wrap">
                            <i class="fa fa-user"></i>
                        </div>
                        <!-- end icon-wrap -->
                        <div class="title-wrap">
                            <h5 class="service-title">HR Module</h5>
                            <hr>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiing elit. Integer lorem quam, adipiscing vel condimentum tristique. <a href="#">Read More</a></p>
                        </div>
                        <!-- end title-wrap -->
                    </div>
                    <!-- end title -->
                </div>
                <!-- end col -->

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="service-style-1 wow fadeIn" data-wow-duration="1s" data-wow-delay="0.7s">
                        <div class="icon-wrap">
                            <i class="fa fa-fax"></i>
                        </div>
                        <!-- end icon-wrap -->
                        <div class="title-wrap">
                            <h5 class="service-title">Biometric Attendance</h5>
                            <hr>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiing elit. Integer lorem quam, adipiscing vel condimentum tristique. <a href="#">Read More</a></p>
                        </div>
                        <!-- end title-wrap -->
                    </div>
                    <!-- end title -->
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end section-white -->

    <section class="section-white">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="widget about-widget wow fadeIn" data-wow-duration="1s" data-wow-delay="0.2s">
                        <div class="widget-title">
                            <h4>Latest News</h4>
                            <hr>
                        </div>
                        <!-- end widget-title -->

                        <ul class="latest-news">
                            <li>
                                <img src="upload/latest_blog_01.png" alt="" class="img-responsive img-rounded alignleft">
                                <h4><a href="#" title="">Blog Tiltle Shall Be Here!</a></h4>
                                <p>Lorem ipsum dolor sit amet, conssectfetufar Integer lorewm quam adipcing condimentum.<a href="#">Read More</a></p>
                                <span>Posted by <a href="#">Begha</a> / Posted on Oct 14, 2014</span>
                            </li>
                            <li>
                                <img src="upload/latest_blog_02.png" alt="" class="img-responsive img-rounded alignleft">
                                <h4><a href="#" title="">Blog Tiltle Shall Be Here!</a></h4>
                                <p>Lorem ipsum dolor sit amet, conssectfetufar Integer lorewm quam adipcing condimentum.<a href="#">Read More</a></p>
                                <span>Posted by <a href="#">Begha</a> / Posted on Oct 14, 2014</span>
                            </li>
                        </ul>
                        <!-- end latest-course -->

                    </div>
                    <!-- end widget -->
                </div>
                <!-- end col -->

                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="widget about-widget wow fadeIn" data-wow-duration="1s" data-wow-delay="0.6s">
                        <div class="widget-title">
                            <h4>Testimonials</h4>
                            <hr>
                        </div>
                        <!-- end widget-title -->

                        <div id="owl-testimonial-2" class="owl-custom">
                            <div class="testi-style-2">
                                <img src="upload/testi_02.png" alt="" class="img-responsive img-circle alignleft">
                                <i class="fa fa-quote-right"></i>
                                <p class="lead">Lorem ipsum doldor sit amet, consectetur adeipiscing elit, sed do eiusmod temdpor incididuent ut labore et doelore magna aliqua..</p>
                                <h4>Begha <span>Senior UI Designer, <small>7oroof Agency</small></span></h4>
                            </div>
                            <!-- end testi-style-2 -->
                            <div class="testi-style-2">
                                <img src="upload/testi_02.png" alt="" class="img-responsive img-circle alignleft">
                                <i class="fa fa-quote-right"></i>
                                <p class="lead">Lorem ipsum doldor sit amet, consectetur adeipiscing elit, sed do eiusmod temdpor incididuent ut labore et doelore magna aliqua..</p>
                                <h4>Begha <span>Senior UI Designer, <small>7oroof Agency</small></span></h4>
                            </div>
                            <!-- end testi-style-2 -->
                        </div>
                        <!-- end owl -->
                    </div>
                    <!-- end widget -->
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
            <div class="row section-container">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="widget about-widget wow fadeIn" data-wow-duration="1s" data-wow-delay="0.6s">
                        <div class="widget-title">
                            <h4>Our Clients</h4>
                            <hr>
                        </div>
                        <!-- end widget-title -->
                        <div id="clients" class="clearfix text-center">
                            <div class="client-image">
                                <a href="#">
                                    <img src="upload/client_01.png" alt="" class="img-responsive"></a>
                            </div>
                            <!-- end client-image -->
                            <div class="client-image">
                                <a href="#">
                                    <img src="upload/client_02.png" alt="" class="img-responsive"></a>
                            </div>
                            <!-- end client-image -->
                            <div class="client-image">
                                <a href="#">
                                    <img src="upload/client_03.png" alt="" class="img-responsive"></a>
                            </div>
                            <!-- end client-image -->
                            <div class="client-image">
                                <a href="#">
                                    <img src="upload/client_04.png" alt="" class="img-responsive"></a>
                            </div>
                            <!-- end client-image -->
                            <div class="client-image">
                                <a href="#">
                                    <img src="upload/client_05.png" alt="" class="img-responsive"></a>
                            </div>
                            <!-- end client-image -->
                            <div class="client-image">
                                <a href="#">
                                    <img src="upload/client_06.png" alt="" class="img-responsive"></a>
                            </div>
                            <!-- end client-image -->
                            <div class="client-image">
                                <a href="#">
                                    <img src="upload/client_01.png" alt="" class="img-responsive"></a>
                            </div>
                            <!-- end client-image -->
                            <div class="client-image">
                                <a href="#">
                                    <img src="upload/client_02.png" alt="" class="img-responsive"></a>
                            </div>
                            <!-- end client-image -->
                            <div class="client-image">
                                <a href="#">
                                    <img src="upload/client_03.png" alt="" class="img-responsive"></a>
                            </div>
                            <!-- end client-image -->
                            <div class="client-image">
                                <a href="#">
                                    <img src="upload/client_04.png" alt="" class="img-responsive"></a>
                            </div>
                            <!-- end client-image -->
                            <div class="client-image">
                                <a href="#">
                                    <img src="upload/client_05.png" alt="" class="img-responsive"></a>
                            </div>
                            <!-- end client-image -->
                            <div class="client-image">
                                <a href="#">
                                    <img src="upload/client_06.png" alt="" class="img-responsive"></a>
                            </div>
                            <!-- end client-image -->
                        </div>
                        <!-- end clients -->
                    </div>
                    <!-- end widget -->
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
            <div class="clearfix"></div>
            <br />
        </div>
        <!-- end container -->
    </section>
    <!-- end section-white -->
</asp:Content>

