function string_value = formatCurrency(value, currencyType)
% This function will format value into a currency value using the
% appropriate seperator between thousands, decimal marker and currency
% symbol.  This function does not convert between currencies it only
% formats the value.
%
% value - any double value
% currencyType - the type of currency to be displayed, the options are:
% US - US dollar
% Euro - Euros
% GBP - pounds
% The default currencyType is US.
%
% example: euros = formatCurrency(5000, 'Euro')
% euros = 5 000,00 €
%
%   Copyright 2008-2009 The MathWorks, Inc.
%   Edited: Jeremy Barry 02/10/2009

import java.util.*;
import java.text.*;

if (nargin == 2)
    switch currencyType
        case 'Euro'
            currLocale = Locale.FRANCE;
        case 'GBP'
            currLocale = Locale.UK;
        case 'US'
            currLocale = Locale.US;
        otherwise
            currLocale = Locale.getDefault();
    end
else
    currLocale = Locale.getDefault();
end
currency = NumberFormat.getCurrencyInstance(currLocale);
string_value = char(currency.format(value));
