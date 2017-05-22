class CdrRecord < ActiveRecord::Base
self.table_name = 'cdr'
establish_connection 'cdr'

end
