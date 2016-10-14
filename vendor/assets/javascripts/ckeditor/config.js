// CKEDITOR.config.mini = function (config) {
//     config.language = 'ru';
//     config.toolbar_mini =     [
//         ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
//         ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
//         ['NumberedList','BulletedList','-','Outdent','Indent'],
//         ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
//         ['Link','Unlink'],
//         ['Image','Table','HorizontalRule'],
//         ['Styles','Format','Font','FontSize'],
//         ['TextColor','BGColor']
//     ];
// };


CKEDITOR.editorConfig = function( config )
{
    config.toolbar_MyToolbar =
        [
            { name: 'document', items : [ 'NewPage','Preview' ] },
            { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
            { name: 'insert', items : [ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'
                ,'Iframe' ] },
            { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','Scayt' ] },
            { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
            '/',
            { name: 'styles', items : [ 'Styles','Format' ] },
            { name: 'basicstyles', items : [ 'Bold','Italic','Strike','-','RemoveFormat' ] },
            { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote' ] }
        ];
};