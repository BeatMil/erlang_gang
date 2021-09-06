-module(my).
-compile(export_all).
-include_lib("stdlib/include/qlc.hrl"). 

-record(person, {id, name, age}).
-record(table_id, {table_name, last_id}).

init() ->
    mnesia:create_schema([node()]),
    mnesia:start(),

    {atomic, ok} = mnesia:create_table(people, [ 
       {record_name, person},
       {attributes, record_info(fields, person)}
    ]),

    {atomic, ok} = mnesia:create_table(table_ids, [
       {record_name, table_id},
       {attributes, record_info(fields, table_id)}
    ]).

start_counter(TableName) ->
    Fun = fun() ->
                mnesia:write(table_ids, 
                  #table_id{table_name=TableName, last_id=0}, 
                  write
                )
          end,
    {atomic, ok} = mnesia:transaction(Fun).



insert(Name, Age) ->
    Index = mnesia:dirty_update_counter(table_ids, people, 1),
    io:format("Index:~p~n", [Index]),
    Fun = fun() ->
                mnesia:write(people,
                    #person{id=Index, name=Name, age=Age},
                )
          end,
    {atomic, ok} = mnesia:transaction(Fun).


find_user() ->
  Query =
    fun() ->
      mnesia:match_object({person, '_', '_', '_'})
    end,
  {atomic, Results} = mnesia:transaction(Query).


select_all() -> 
  Query =
    fun() ->
      mnesia:match_object({table_ids, '_', '_'})
    end,
  {atomic, Results} = mnesia:transaction(Query).
