# The IP address the notebook server will listen on.
c.NotebookApp.ip = '0.0.0.0'

# The port the notebook server will listen on.
c.NotebookApp.port = 8890

# The directory to use for notebooks and kernels.
c.NotebookApp.notebook_dir = u''

# Glob patterns to hide in file and directory listings.
c.ContentsManager.hide_globs = ['__pycache__', '*.pyc', '*.pyo', '.DS_Store','img','kernels','conf']

# Username for the Session. Default is your system username.
c.Session.username = u'cloudera'

# The string should be of the form type:salt:hashed-password.
# password='cloudera'
c.NotebookApp.password = u'sha1:ea57e7145479:93ea088bdea924a2bc093d310fd030fd24f7befd'

# Whether to open in a browser after starting.
c.NotebookApp.open_browser = False










