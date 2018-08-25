package com.peregrine.getfit.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.SkipPageException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.text.DecimalFormat;

public class NumbersFormatter extends SimpleTagSupport {

    private String format;
    private String number;

    public NumbersFormatter() {
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    @Override
    public void doTag() throws JspException, IOException {
        try {
            double amount = Double.parseDouble(number);
            DecimalFormat formatter = new DecimalFormat(format);
            String formattedNumber = formatter.format(amount);
            getJspContext().getOut().write(formattedNumber);
        } catch (Exception e) {
            e.printStackTrace();
            // stop page from loading further by throwing SkipPageException
            throw new SkipPageException("Exception in formatting " + number
                    + " with format " + format);
        }
    }

}