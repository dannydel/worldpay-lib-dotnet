﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateOrder.aspx.cs" Inherits="Worldpay.Sdk.Examples.CreateOrder" MasterPageFile="Master.Master" %>

<%@ Register TagPrefix="uc" TagName="ErrorControl" Src="ErrorControl.ascx" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <script type="text/javascript" src="<%= Session["js_endpoint"] %>"></script>
    <form id="aspnetForm" runat="server">
        <h1>.NET Library Create Order Example</h1>
            
        <asp:Panel runat="server" ID="RequestPanel">
            <div class="payment-errors"></div>
            <div class="header">Checkout</div>

             <div class="form-row">
                <label>Direct Order?</label>
                 <select id="direct-order" name="direct-order">
                    <option value="1">Yes</option>
                    <option value="0" selected>No</option>
                </select>
            </div>

            <div class="form-row">
                <label>Order Type</label>
                <select id="orderType" name="orderType">
                    <option value="ECOM" selected="selected">ECOM</option>
                    <option value="MOTO">MOTO</option>
                    <option value="APM">APM</option>
                </select>
            </div>

            <div class="form-row apm" style="display:none;">
                <label>APM</label>
                <select id="apm-name" data-worldpay="apm-name">
                    <option value="paypal" selected="selected">PayPal</option>
                    <option value="giropay">Giropay</option>
                    <option value="ideal">iDEAL</option>
                    <option value="sofort">Sofort</option>
                    <option value="przelewy24">Przelewy24</option>
                    <option value="alipay">Alipay</option>
                    <option value="paysafecard">PaySafeCard</option>
                    <option value="postepay">Postepay</option>
                    <option value="yandex">Yandex</option>
                    <option value="qiwi">Qiwi</option>
                    <option value="mistercash">MisterCash</option>
                </select>
            </div>

            <div class="form-row no-apm">
                <label>Site Code</label>
                <input type="text" id="site-code" name="site-code" value="N/A" />
            </div>

            <div class="form-row">
                <label>Name</label>
                <input type="text" id="name" name="name" data-worldpay="name" value="Example Name" />
            </div>

            <div class="form-row apm apm-url" style="display:none;">
                <label>
                    Success URL
                </label>
                <input type="text" id="success-url" name="success-url" placeholder='<%Response.Write( Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/apmSuccess.aspx");%>'/>
            </div>

             <div class="form-row apm apm-url" style="display:none;">
                <label>
                    Cancel URL
                </label>
                <input type="text" id="cancel-url" name="cancel-url" placeholder='<%Response.Write( Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/apmCancel.aspx");%>'/>
            </div>

             <div class="form-row apm apm-url" style="display:none;">
                <label>
                    Failure URL
                </label>
                <input type="text" id="failure-url" name="failure-url" placeholder='<%Response.Write( Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/apmFailure.aspx");%>'/>
            </div>

             <div class="form-row apm apm-url" style="display:none;">
                <label>
                    Pending URL
                </label>
                <input type="text" id="pending-url" name="pending-url" placeholder='<%Response.Write( Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/apmPending.aspx");%>'/>
            </div>

            <div class="form-row no-apm">
                <label>Card Number</label>
                <input type="text" id="card" size="20" data-worldpay="number" value="4444333322221111" />
            </div>
            
            
            <div class="form-row no-apm">
                <label>CVC</label>
                <input type="text" id="cvc" size="4" data-worldpay="cvc" value="321" />
            </div>

            <div class="form-row no-apm">
                <label>Expiration (MM/YYYY)</label>
                <select id="expiration-month" data-worldpay="exp-month">
                    <option value="01">01</option>
                    <option value="02">02</option>
                    <option value="03">03</option>
                    <option value="04">04</option>
                    <option value="05">05</option>
                    <option value="06">06</option>
                    <option value="07">07</option>
                    <option value="08">08</option>
                    <option value="09">09</option>
                    <option value="10" selected="selected">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>
                <span> / </span>
                <select id="expiration-year" data-worldpay="exp-year">
                    <option value="2015">2015</option>
                    <option value="2016" selected="selected">2016</option>
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                    <option value="2019">2019</option>
                    <option value="2020">2020</option>
                    <option value="2021">2021</option>
                </select>
            </div>

            <div class="form-row">
                <label>Amount</label>
                <input type="text" id="amount" size="4" name="amount" value="15.23" />
            </div>

            <div class="form-row">
                <label>Currency</label>
                <input type="text" id="currency" name="currency" value="GBP" />
            </div>

            <div class="form-row">
                <label>Settlement Currency</label>
                 <select id="settlement-currency" name="settlement-currency">
                    <option value="" selected></option>
                    <option value="USD">USD</option>
                    <option value="GBP">GBP</option>
                    <option value="EUR">EUR</option>
                    <option value="CAD">CAD</option>
                    <option value="NOK">NOK</option>
                    <option value="SEK">SEK</option>
                    <option value="SGD">SGD</option>
                    <option value="HKD">HKD</option>
                    <option value="DKK">DKK</option>
                </select>
            </div>

            <div class="form-row reusable-token-row">
                <label>Reusable Token</label>
                <input type="checkbox" id="chkReusable" name="chkReusable" />
            </div>

            <div class="form-row no-apm">
                <label>Use 3DS</label>
                <input type="checkbox" id="chk3Ds" name="3ds" />
            </div>

            <div class="form-row no-apm">
                <label>Authorize Only</label>
                <input type="checkbox" id="chkAuthorizeOnly" name="authorizeOnly" />
            </div>

            <div class="header">Billing address</div>

            <div class="form-row">
                <label>Address 1</label>
                <input type="text" id="address1" name="address1" value="123 House Road" />
            </div>

            <div class="form-row">
                <label>Address 2</label>
                <input type="text" id="address2" name="address2" value="A village" />
            </div>

            <div class="form-row">
                <label>Address 3</label>
                <input type="text" id="address3" name="address3" value="" />
            </div>

            <div class="form-row">
                <label>City</label>
                <input type="text" id="city" name="city" value="London" />
            </div>

            <div class="form-row">
                <label>Postcode</label>
                <input type="text" id="postcode" name="postcode" value="EC1 1AA" />
            </div>

            <div class="form-row">
                <label>Country Code</label>
                <input type="text" id="country-code" name="countryCode" value="GB" />
            </div>

            <div class="form-row">
                <label>Telephone Number</label>
                <input type="text" id="telephone-number" name="telephone-number" value="" />
            </div>

            <div class="header">Delivery address</div>
            <div class="form-row">
                <label>
                    First Name
                </label>
                <input type="text" id="delivery-first-name" name="delivery-firstName" value="John" />
            </div>
            <div class="form-row">
                <label>
                    Last Name
                </label>
                <input type="text" id="delivery-last-name" name="delivery-lastName" value="Doe" />
            </div>
            <div class="form-row">
                <label>
                    Address 1
                </label>
                <input type="text" id="delivery-address1" name="delivery-address1" value="123 House Road" />
            </div>

            <div class="form-row">
                <label>
                    Address 2
                </label>
                <input type="text" id="delivery-address2" name="delivery-address2" value="A village" />
            </div>

            <div class="form-row">
                <label>
                    Address 3
                </label>
                <input type="text" id="delivery-address3" name="delivery-address3" value="" />
            </div>

            <div class="form-row">
                <label>
                    City
                </label>
                <input type="text" id="delivery-city" name="delivery-city" value="London" />
            </div>

            <div class="form-row">
                <label>
                    Postcode
                </label>
                <input type="text" id="delivery-postcode" name="delivery-postcode" value="EC1 1AA" />
            </div>

            <div class="form-row">
                <label>
                    Country Code
                </label>
                <input type="text" id="delivery-country-code" name="delivery-countryCode" value="GB" />
            </div>

            <div class="form-row">
                <label>Telephone Number</label>
                <input type="text" id="delivery-telephone-number" name="delivery-telephone-number" value="" />
            </div>

            <div class="header">Other</div>

            <div class="form-row">
                <label>Order Description</label>
                <input type="text" id="description" name="description" value="My test order" />
            </div>

            <div class="form-row">
                <label>Customer Order Code</label>
                <input type="text" id="customer-order-code" name="customer-order-code" value="" />
            </div>

            <div class="form-row">
                <label>Order Code Prefix</label>
                <input type="text" id="order-code-prefix" name="order-code-prefix" value="" />
            </div>

            <div class="form-row">
                <label>Order Code Suffix</label>
                <input type="text" id="order-code-suffix" name="order-code-suffix" value="" />
            </div>

            <div class="form-row">
                <label>
                    Statement Narrative
                </label>
                <input type="text" id="statement-narrative" maxlength="24" name="statement-narrative" value="Statement Narrative" />
            </div>

            <div class="form-row language-code-row">
                <label>Shopper Language Code</label>
                <input type="text" id="language-code" maxlength="2" data-worldpay="language-code" value="EN" />
            </div>

            <div class="form-row">
                <label>Shopper Email</label>
                <input type="text" id="shopper-email" name="shopper-email" value="shopper@email.com" />
            </div>

            <div class="form-row shopper-bank-code-row" style="display:none">
                <label>Shopper Bank Code</label>
                <input type="text" id="shopper-bank-code" name="shopper-bank-code" value="RABOBANK" />
            </div>

            <div class="form-row swift-code-row apm" style="display:none">
                <label>
                    Swift Code
                </label>
                <input type="text" id="swift-code" value="NWBKGB21" />
            </div>

            <div class="form-row large">
                <label class='left'>
                    Customer Identifiers (json)
                </label>
                <textarea id="customer-identifiers" rows="6" cols="30" name="customer-identifiers"></textarea>
            </div>

            <div class="apmName apm"></div>

            <input name="env" type="hidden" value=""/>
            <div>
                <asp:Button ID="PlaceOrder" runat="server" Text="Place Order" />
            </div>
        </asp:Panel>

        <asp:Panel runat="server" ID="SuccessPanel" Visible="false">
            <h2>Response</h2>
            <p>Order Code: <span id="order-code"><asp:Literal runat="server" ID="ResponseOrderCode" /></span></p>
            <p>Token: <span id="token"><asp:Literal runat="server" ID="ResponseToken" /></span></p>
            <p>Payment Status: <span id="payment-status"><asp:Literal runat="server" ID="ResponsePaymentStatus" /></span></p>
            <pre><asp:Literal runat="server" ID="ResponseJson" /></pre>
            <asp:Literal runat="server" ID="OrderResponse"></asp:Literal>
        </asp:Panel>
        <uc:ErrorControl ID="ErrorControl" runat="server"/>

    </form>
    <script type="text/javascript">

        var showShopperBankCodeField = function () {
            $('#shopper-bank-code').attr('data-worldpay-apm', 'shopperBankCode');
            $('.shopper-bank-code-row').show();
        };
        var hideShopperBankCodeField = function () {
            $('#shopper-bank-code').removeAttr('data-worldpay-apm');
            $('.shopper-bank-code-row').hide();
        };

        var showSwiftCodeField = function () {
            $('#swift-code').attr('data-worldpay-apm', 'swiftCode');
            $('.swift-code-row').show();
        }

        var hideSwiftCodeField = function () {
            $('#swift-code').removeAttr('data-worldpay-apm');
            $('.swift-code-row').hide();
        }

        var showLanguageCodeField = function () {
            $('#language-code').attr('data-worldpay', 'language-code');
            $('.language-code-row').show();
        }

        var hideLanguageCodeField = function () {
            $('#language-code').removeAttr('data-worldpay');
            $('.language-code-row').hide();
        }

        var showReusableTokenField = function () {
            $('.reusable-token-row').show();
        }

        var hideReusableTokenField = function () {
            $('.reusable-token-row').hide();
        }

        Worldpay.setClientKey('<%= Session["client_key"] %>');
        Worldpay.api_path = '<%= Session["apiendpoint"] %>/';

        // This is required as .NET 2.0 doesn't have ClientIDMode="static", so we can't set the form's id to anything
        // other than "aspnetForm"
        var form = document.getElementById('aspnetForm');

        var _triggerWorldpayUseForm = function () {
            Worldpay.useForm(form, function (status, response) {
                if (response.error) {
                    Worldpay.handleError(form, $('.payment-errors')[0], response.error);
                } else {
                    var token = response.token;
                    Worldpay.formBuilder(form, 'input', 'hidden', 'token', token);
                    form.submit();
                }

            });
        };
        _triggerWorldpayUseForm();

        $('#chkReusable').prop('checked', false);
        $('#chkReusable').change(function () {
            if ($(this).is(':checked') && $('#apm-name').val() != 'giropay') {
                Worldpay.reusable = true;
            }
            else {
                Worldpay.reusable = false;
            }
        });

        $('#direct-order').on('change', function () {
            var isDirectOrder = $(this).val();
            if (isDirectOrder == 1) {
                form.onsubmit = null;

                //add names to card form parameters
                $('#card').attr('name', 'number');
                $('#cvc').attr('name', 'cvc');
                $('#expiration-month').attr('name', 'exp-month');
                $('#expiration-year').attr('name', 'exp-year');
                $('#apm-name').attr('name', 'apm-name');
                $('#swift-code').attr('name', 'swiftCode');
                $('#shopper-bank-code').attr('name', 'shopperBankCode');
                $('#language-code').attr('name', 'language-code');           
            }
            else {
                $('#card, #cvc, #exp-month, #exp-year, #apm-name, #swiftCode, #shopperBankCode, #language-code').removeAttr('name');
                _triggerWorldpayUseForm();
            }
        });

        $('#orderType').on('change', function () {
            if ($(this).val() == 'APM') {
                Worldpay.tokenType = 'apm';
                $('.apm').show();
                $('.no-apm').hide();

                //initialize fields
                hideShopperBankCodeField();
                hideSwiftCodeField();
                showReusableTokenField();
                showLanguageCodeField();

                //handle attributes
                $('#card').removeAttr('data-worldpay');
                $('#cvc').removeAttr('data-worldpay');
                $('#expiration-month').removeAttr('data-worldpay');
                $('#expiration-year').removeAttr('data-worldpay');
                $('#country-code').attr('data-worldpay', 'country-code');
            } else {
                Worldpay.tokenType = 'card';
                $('.apm').hide();
                $('.no-apm').show();
                $('#card').attr('data-worldpay', 'number');
                $('#cvc').attr('data-worldpay', 'cvc');
                $('#expiration-month').attr('data-worldpay', 'exp-month');
                $('#expiration-year').attr('data-worldpay', 'exp-year');
                $('#country-code').removeAttr('data-worldpay');
            }
        });

        $('#apm-name').on('change', function () {
            var _apmName = $(this).val();

            hideSwiftCodeField();
            hideShopperBankCodeField();
            hideLanguageCodeField();
            hideReusableTokenField();

            $('#country-code').val('GB');
            $('#currency').val('GBP');

            switch (_apmName) {
                case 'mistercash':
                    showReusableTokenField();
                    showLanguageCodeField();
                    $('#country-code').val('BE');
                    break;
                case 'yandex':
                case 'qiwi':
                    showReusableTokenField();
                    showLanguageCodeField();
                    $('#country-code').val('RU');
                    break;
                case 'postepay':
                    showReusableTokenField();
                    showLanguageCodeField();
                    $('#country-code').val('IT');
                    break;
                case 'alipay':
                    showReusableTokenField();
                    showLanguageCodeField();
                    $('#country-code').val('CN');
                    break;
                case 'przelewy24':
                    showReusableTokenField();
                    showLanguageCodeField();
                    $('#country-code').val('PL');
                    break;
                case 'sofort':
                    showReusableTokenField();
                    showLanguageCodeField();
                    $('#country-code').val('DE');
                    break;
                case 'giropay':
                    Worldpay.reusable = false;
                    showSwiftCodeField();
                    $('#currency').val('EUR');
                    break;
                case 'ideal':
                    //reusable token field is available for all apms (except giropay)
                    showReusableTokenField();
                    //language code enabled for all apms (except giropay)
                    showLanguageCodeField();
                    //shopper bank code field is only available for ideal
                    showShopperBankCodeField();
                    break;
                default:
                    showReusableTokenField();
                    showLanguageCodeField();
                    break;
            }

        });
    </script>
</asp:Content>
