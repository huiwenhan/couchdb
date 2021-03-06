% Licensed under the Apache License, Version 2.0 (the "License"); you may not
% use this file except in compliance with the License.  You may obtain a copy of
% the License at
%
%   http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
% WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
% License for the specific language governing permissions and limitations under
% the License.

-module(global_changes_httpd_handlers).

-export([url_handler/1, db_handler/1, design_handler/1, handler_info/3]).

url_handler(<<"_db_updates">>) -> fun global_changes_httpd:handle_global_changes_req/1;
url_handler(_) -> no_match.

db_handler(_) -> no_match.

design_handler(_) -> no_match.

handler_info('GET', [<<"_db_updates">>], _) ->
    {'db_updates.read', #{}};

handler_info(_, _, _) ->
    no_match.