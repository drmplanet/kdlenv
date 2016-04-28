import sys
import gdb

# Update module path.
dir_ = '/root/koreader/base/thirdparty/glib/build/arm-linux-gnueabi/glib-prefix/src/glib-build/share/glib-2.0/gdb'
if not dir_ in sys.path:
    sys.path.insert(0, dir_)

from gobject import register
register (gdb.current_objfile ())
