<%@ Control Language="C#" AutoEventWireup="true" CodeFile="main_search.ascx.cs" Inherits="custom_controls_templates_main_search" %>


<%--<section class="search-control">
    <div class="searchContainer">
        <div class="search-textbox">
            <div class="enterLocation">
                <input type="text" value="Enter location">
                <div>
                    <button type="button" class="ddl" data-toggle="dropdown">
                        To Buy
                            <span></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">To Buy</a></li>
                        <li><a href="#">For Rent</a></li>
                        <li><a href="#">Short Stays</a></li>
                    </ul>
                </div>

            </div>
        </div>
        <div ></div>
        <div class="search_ranges_button_container">
            <div class="search_ranges_button">
                <div class="search-ranges">
                    <div class="newline">&nbsp;</div>
                    <div class="search-ranges-controls">
                        <div class="search-ranges-category">
                            <div class="dv_space">
                                <div class="dv_space_div1">
                                    <label class="Label2">Property type</label>
                                </div>
                                <div class="dv_space_div2">
                                    <div class="dv_space_div2_div1">
                                        <div class="dv_space_div2_div1_div">
                                            <button type="button" data-toggle="dropdown">
                                                All  <span></span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">All Resclassential</a></li>
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
                                    <div class="dv_space_div2_div2"></div>
                                </div>

                            </div>
                        </div>
                        <div class="search-ranges-bedroom">
                            <div class="search_ranges_bedroom_div">
                                <div class="search_ranges_bedroom_div_div1">
                                    <div class="search_ranges_bedroom_div_div1_div1"></div>
                                    <div class="search_ranges_bedroom_div_div1_div2">
                                        <label class="Label3">Bedrooms</label>
                                    </div>
                                </div>
                                <div class="search_ranges_bedroom_div_div2">
                                    <div></div>
                                    <div class="search_ranges_bedroom_div_div2_div2">
                                        <div class="search_ranges_bedroom_div_div2_div2_div">
                                            <button type="button" class="btnBedrooms" data-toggle="dropdown">
                                                All <span class="btnBedrooms_span"></span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
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
                            <div class="search_ranges_price_div">
                                <div class="search_ranges_price_div_div1">
                                    <label class="Label4">Price range in AED</label>
                                </div>
                                <div class="search_ranges_price_div_div2">
                                    <div class="search_ranges_price_div_div2_div1">
                                        <div class="search_ranges_price_div_div2_div1_div">
                                            <button type="button" class="btnMinPrice" data-toggle="dropdown">
                                                Min  <span class="btnMinPrice_span"></span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
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
                                    <div class="search_ranges_price_div_div2_div2">
                                        <label>to</label>
                                    </div>
                                    <div class="search_ranges_price_div_div2_div3">
                                        <div class="search_ranges_price_div_div2_div3_div">
                                            <button type="button" class="btnMaxPrice" data-toggle="dropdown">
                                                Max   <span class="btnMaxPrice_span"></span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
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
                <div class="search-button">
                    <div class="search_button_div">
                        <div class="search_button_div_div1">
                            <button type="button" class="btnSearch">Search</button>
                        </div>
                        <div class="search_button_div_div2">
                            <div class="dvOR">
                                <div class="dvl">|</div>
                                <div>or</div>
                                <div class="dvl">|</div>
                            </div>
                        </div>
                        <div class="search_button_div_div3">

                            <div class="dvagent_icon">
                                <img class="agent" width="26" height="35" src="images/agentmob.png" />
                            </div>
                            <div class="dvIcon_space">
                            </div>
                            <div class="dvdrawSearch_icon">
                                <img class="draw-search" width="26" height="35" src="images/drawsearchmob.png" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="Searh_Text">
                    <div class="Search_Text_div1">
                    </div>
                    <div class="Search_Text_div2">
                    </div>
                    <div class="Search_Text_div3">
                        <div class="Search_Text_div3_div1">
                            <label class="SearchText">Agent Search</label>
                        </div>
                        <div class="Search_Text_div3_div2">
                        </div>
                        <div class="Search_Text_div3_div3">
                            <label>Draw Search</label>
                        </div>

                    </div>

                </div>
                <div class="advance_search">
                    <div class="advance_search_div1">
                        Advanced search<span class="advance_search_span"></span>
                    </div>
                    <div class="advance_search_div2"></div>
                    <div class="advance_search_div3">+971 600 52 2212</div>
                </div>
            </div>
        </div>
    </div>
</section>--%>










