<%@ Control Language="C#" AutoEventWireup="true" CodeFile="main_search.ascx.cs" Inherits="customcontrols_main_search" %>
<section class="search-control">
    <div class="searchContainer">
        <div class="search-textbox">    
                <div class="enterLocation">
                    <input type="text" value="Enter location">
                    <div class="icons">
                        <button type="button" class="ddl"  data-toggle="dropdown">
                            To Buy
                            <span ></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">To Buy</a></li>
                            <li><a href="#">For Rent</a></li>
                            <li><a href="#">Short Stays</a></li>
                        </ul>
                    </div>

                </div>


      
        </div>
        <div class="search-ranges-button-container">
            <div class="search-ranges-button">
                <div class="search-ranges">
                    <div class="newline">&nbsp;</div>
                    <div class="search-ranges-controls">
                        <div class="search-ranges-category ">
                            <div class="row margin-top">
                                <div class="col-lg-12 col-xs-12 ">
                                    <label id="Label2">Property type</label>
                                </div>
                                <div class="col-lg-12 col-xs-12 ">
                                    <div class="col-lg-11 col-xs-11 ">
                                        <div class="btn-group dropdown">
                                            <button class="btn dropdown-toggle main-search-enterLocation dropdownMenu1 btnMobile" type="button" id="Button2" data-toggle="dropdown">
                                                All  <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu bhomes-btn-group-ul" role="menu" aria-labelledby="dLabel">
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">All Residential</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Apartment</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Villa</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">All Commercial</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Office Space</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Retail Space<</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Warehouse</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Labour Housing</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-1 col-xs-1 "></div>
                                </div>

                            </div>
                        </div>
                        <div class="search-ranges-bedroom">
                            <div class="row margin-top">

                                <div class="col-lg-12 col-xs-12 ">
                                    <div class="col-lg-1 col-xs-1 "></div>
                                    <div class="col-lg-11 col-xs-11 ">
                                        <label id="Label3">Bedrooms</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-xs-12 ">
                                    <div class="col-lg-1 col-xs-1 "></div>
                                    <div class="col-lg-11 col-xs-11 ">
                                        <div class="btn-group dropdown">
                                            <button class="btn dropdown-toggle main-search-enterLocation dropdownMenu1 btnMobile" type="button" id="Button3" data-toggle="dropdown">
                                                All <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu bhomes-btn-group-ul" role="menu" aria-labelledby="dLabel">
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">All</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Studio</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">3</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">4</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">5</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">6</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">7</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">8</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">9+</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="search-ranges-price">
                            <div class="row">
                                <div class="col-lg-12 col-xs-12 margin-top">
                                    <label id="Label4">Price range in AED</label>

                                </div>

                                <div class="col-lg-12 col-xs-12">
                                    <div class="col-lg-5 col-xs-5">
                                        <div class="btn-group dropdown">
                                            <button class="btn dropdown-toggle main-search-enterLocation dropdownMenu1 btnMobile" type="button" id="Button4" data-toggle="dropdown">
                                                Min  <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu bhomes-btn-group-ul" role="menu" aria-labelledby="dLabel">
                                                <li><a role="menuitem" tabindex="-1" href="#">Min</a> </li>
                                                <li><a role="menuitem" tabindex="-1" href="#">1 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">2 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">3 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">4 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">5 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">6 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">7 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">8 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">9 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">10 m</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-xs-2">
                                        <label id="Label1" class="lblTo">to</label>
                                    </div>
                                    <div class="col-lg-5 col-xs-5">
                                        <div class="btn-group dropdown">
                                            <button class="btn dropdown-toggle main-search-enterLocation dropdownMenu1 btnMobile" type="button" id="Button5" data-toggle="dropdown">
                                                Max   <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu .bhomes-btn-group-ul" role="menu" aria-labelledby="dLabel">
                                                <li><a role="menuitem" tabindex="-1" href="#">Min</a> </li>
                                                <li><a role="menuitem" tabindex="-1" href="#">1 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">2 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">3 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">4 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">5 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">6 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">7 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">8 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">9 m</a></li>
                                                <li><a role="menuitem" tabindex="-1" href="#">10 + m</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-lg-4 ">
                    <div class="row margin-top-forMobile col-lg-css-width">
                        <div class="col-xs-5">
                            <button type="button" class="btn-group btn btnSearch">Search</button>
                        </div>
                        <div class="col-xs-2">
                            <div class="dvOR">
                                <div class="dvl">|</div>
                                <div>or</div>
                                <div class="dvl">|</div>
                            </div>
                        </div>
                        <div class="col-xs-5 agentAndDrawSearchIcons">

                            <div class=" col-xs-5 search2 agentIcon">
                                <img class="agent" width="26" height="35" src="../../images/agentmob.png" />

                            </div>
                            <div class="col-xs-2">
                            </div>
                            <div class="col-xs-5 search2 darwSearchIcon">
                                <img class="draw-search" width="26" height="35" src="../../images/drawsearchmob.png" />

                            </div>

                        </div>
                    </div>
                </div>
                <div class="search-button col-lg-css-width">

                    <div class="col-xs-5">
                    </div>
                    <div class="col-xs-2">
                    </div>
                    <div class="col-xs-5 ">

                        <div class=" col-xs-5 ">

                            <label class="SearchText">Agent Search</label>
                        </div>
                        <div class="col-xs-2">
                        </div>
                        <div class="col-xs-5 SearchText">
                            <label>Draw Search</label>
                        </div>

                    </div>

                </div>
                <div class="col-lg-12 col-xs-12 col-lg-css-width margin-bottom">
                    <div class="col-lg-5 col-xs-5 advance-text">
                        Advanced search<span class="caret"></span>
                    </div>
                    <div class="col-lg-2 col-xs-1"></div>
                    <div class="col-lg-5 col-xs-6 AdSearchcontactNo">+971 600 52 2212</div>
                </div>
            </div>
        </div>
    </div>
</section>
















