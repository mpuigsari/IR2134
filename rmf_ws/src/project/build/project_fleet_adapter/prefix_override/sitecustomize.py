import sys
if sys.prefix == '/usr':
    sys.real_prefix = sys.prefix
    sys.prefix = sys.exec_prefix = '/home/usuario/IR2134/rmf_ws/src/project/install/project_fleet_adapter'
