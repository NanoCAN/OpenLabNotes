<%@ page import="org.openlab.notes.NoteItem" %>

		<script>
		tinymce.init({
			menubar:false,
			plugins: [
		                "table textcolor code print"
		    ],
		    width: 1000,
            height: 800,
		    selector: "textarea",
		    toolbar1: "print | cut copy paste | searchreplace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor image media code | inserttime preview | table",
	        toolbar2: "bold italic underline strikethrough |formatselect fontselect fontsizeselect | alignleft aligncenter alignright alignjustify | forecolor backcolor",
		});
		</script>
        <style>
        #mce_fullscreen_container {
            background:none;
            background: rgba(0, 0, 0, 0.6);
            -ms-filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,endColorstr=#99000000);
            filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,endColorstr=#99000000);
            zoom: 1;
        }

        table#mce_fullscreen_tbl.mceLayout {
            margin: 20px auto 0;
        }
        </style>

<g:hiddenField name="status" value="draft"/>
<table>
	<tbody>
		<tr>
			
			<td>
				<div class="fieldcontain ${hasErrors(bean: noteItemInstance, field: 'title', 'error')} ">
				<label for="title">
					<g:message code="noteItem.title.label" default="Title" />
				</label>
				</div>
			</td>
			<td>
				<g:textField name="title" value="${noteItemInstance?.title}"/>
			</td>
		</tr>
		<tr>
			<td>
				<div class="fieldcontain ${hasErrors(bean: noteItemInstance, field: 'note', 'error')} ">
				<label for="note">
					<g:message code="noteItem.note.label" default="Note" />
				</label>
				</div>
			</td>
			<td>
				<textarea name="note">${noteItemInstance?.note}</textarea>
			</td>
		</tr>
	</tbody>
</table>
