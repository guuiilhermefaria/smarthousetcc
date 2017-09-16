package com.smarthouse.controller;

import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.view.InternalResourceView;

public class JstlView extends InternalResourceView {

    @Override
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //super.renderMergedOutputModel(model, request, response); //To change body of generated methods, choose Tools | Templates.
        // Determine the path for the request dispatcher.
        String dispatcherPath = prepareForRendering(request, response);

        // set original view being asked for as a request parameter
        request.setAttribute("partial", dispatcherPath.substring("/WEB-INF/views/".length()));

        for (Map.Entry<String, Object> entry : model.entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();
            request.setAttribute(key, value);
        }
        // force everything to be template.jsp
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/template.jsp");
        requestDispatcher.include(request, response);
    }
}
