<%------------------------------------------------------------------------
Copyright 2009 Søren Lund <soren@lund.org>

This file is part of Simple JSP Upload.

Simple JSP Upload is free software: you can redistribute it and/or
modify it under the terms of the GNU General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

Simple JSP Upload is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with Simple JSP Upload.  If not, see http://www.gnu.org/licenses/
------------------------------------------------------------------------%>

<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.io.*, org.apache.commons.fileupload.servlet.*, org.apache.commons.fileupload.disk.*, java.io.*, java.util.Iterator, java.util.regex.Pattern" %>
<%
// This pattern is used to get the basename of a filename
final Pattern basenamePattern = Pattern.compile("^.*[/\\\\]");

// Check that we have a file upload request
boolean isMultipart = ServletFileUpload.isMultipartContent(request);

// if not, send to message page with the error message
if(!isMultipart){
    request.setAttribute("msg", "Request was not multipart!");
    request.getRequestDispatcher("dialog.jsp").forward(request, response);
    return;
}

String uploadPath = System.getProperty("os.name").matches("Windows.*") ?
                    "C:\\TEMP\\uploads\\" : "/tmp/uploads/";

// Create a new file upload handler
ServletFileUpload upload = new ServletFileUpload();


// Parse the request
FileItemIterator iter = upload.getItemIterator(request);
while (iter.hasNext()) {
    FileItemStream item = iter.next();
    InputStream stream = item.openStream();
    if (!item.isFormField()) {
        String fileName = item.getName();
        String uploadedFile = uploadPath + basenamePattern.matcher(fileName).replaceFirst("");;

        IOUtils.copy(stream, new FileOutputStream(uploadedFile));

        request.setAttribute("msg", "Uploaded '" + fileName + "' to '" + uploadedFile);
    }
}

// finally send to the msg page
request.getRequestDispatcher("dialog.jsp").forward(request, response);

%>
