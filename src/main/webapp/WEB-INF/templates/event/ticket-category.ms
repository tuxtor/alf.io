<li class="list-group-item {{#expired}}text-muted expired{{/expired}} ticket-category-restricted-{{accessRestricted}}">
    <div class="form-group">
        <div class="col-sm-7" id="{{id}}-label">
            <label class="control-label">{{name}}</label>
            {{^expired}}
                <div>
                    {{#saleInFuture}}
                        {{#i18n}}show-event.sales-not-started{{/i18n}}
                    {{/saleInFuture}}
                    {{^saleInFuture}}
                        {{#i18n}}show-event.sales-end [{{#format-date}}{{zonedExpiration}} dd.MM.yyyy HH:mm locale:{{#i18n}}locale{{/i18n}}{{/format-date}}]{{/i18n}}
                    {{/saleInFuture}}
                </div>
            {{/expired}}
            {{#expired}}
                <div>
                    {{#i18n}}show-event.sales-ended [{{#format-date}}{{zonedExpiration}} dd.MM.yyyy HH:mm locale:{{#i18n}}locale{{/i18n}}{{/format-date}}]{{/i18n}}
                </div>
            {{/expired}}
            <div>
                {{description}}
            </div>
        </div>
        <div class="col-sm-3">
            <label class="control-label">
                {{#free}}
                    {{#i18n}}common.free{{/i18n}}
                {{/free}}
                {{^free}}
                    {{#expired}}
                        {{finalPrice}} {{event.currency}}
                    {{/expired}}
                    {{^expired}}
                        {{#hasPromoCodeDiscount}}
                            <del>{{finalPrice}}</del>
                            <mark>{{discountedPrice}}</mark>
                            {{event.currency}}
                        {{/hasPromoCodeDiscount}}
                        {{^hasPromoCodeDiscount}}
                            {{finalPrice}} {{event.currency}}
                        {{/hasPromoCodeDiscount}}
                        <i class="fa fa-info-circle text-info tooltip-handler" title="{{#event.vatIncluded}}{{#i18n}}show-event.incVat [{{event.vat}}]{{/i18n}}{{/event.vatIncluded}}{{^event.vatIncluded}}{{#i18n}}show-event.excVat [{{event.vat}}]{{/i18n}}{{/event.vatIncluded}}"></i>
                    {{/expired}}
                {{/free}}
            </label>
        </div>
        <div class="col-sm-2 text-align-center">
            {{#saleable}}
                <input name="reservation[{{-index}}].ticketCategoryId" value="{{id}}" type="hidden">
                <select aria-labelledby="{{id}}-label" name="reservation[{{-index}}].amount" class="form-control text-align-center" placeholder="0" autocomplete="off">
                    {{#accessRestricted}}
                        <option value="0">0</option>
                        <option value="1">1</option>
                    {{/accessRestricted}}
                    {{^accessRestricted}}
                        {{#amountOfTickets}}<option value="{{this}}">{{this}}</option>{{/amountOfTickets}}
                    {{/accessRestricted}}
                </select>
            {{/saleable}}
            {{^saleable}}
                <label class="control-label">
                    {{#soldOut}}
                        {{#i18n}}show-event.sold-out{{/i18n}}
                    {{/soldOut}}
                    {{^soldOut}}
                        {{#i18n}}show-event.not-available{{/i18n}}
                    {{/soldOut}}
                </label>
            {{/saleable}}
        </div>
    </div>
</li>