<!-- <%end%> -->
<!-- <%if current_user.id == @pose.user_id%> -->
<p class="edit"><%=button_to "Edit", edit_pose_path(@pose), method: :get%></p>
