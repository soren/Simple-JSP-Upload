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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><jsp:include page="inc/header.jsp" /></head>
<body>
<form name="upload" action="stream.jsp" method="post" enctype="multipart/form-data">
File: <input type="file" name="file">
<input type="submit" name="submit" value="Upload"/>
</form>
<jsp:include page="inc/footer.jsp" />
</body>
</html>
