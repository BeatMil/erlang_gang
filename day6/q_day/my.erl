-module(my).
-compile(export_all).
-record(people, {id, name, age}). 
-record(table_id, {table_name, last_id}).


setup() ->
    mnesia:create_schema([node()]),
    mnesia:start(),
    mnesia:create_table(table_id, [
       {disc_copies, [node()]},
       {attributes, record_info(fields, table_id)} ]),
    mnesia:create_table(people,    [
       {disc_copies, [node()]},
       {attributes, record_info(fields, people)}]).


start_count() ->
  Insert =
    fun() ->
      mnesia:write(
        #table_id{
          table_name = people,
          last_id = 0
        })
    end,
  {atomic, Results} = mnesia:transaction(Insert).


insert_user(Name, Age) ->
  Index = mnesia:dirty_update_counter(table_id, people, 1),
  Insert =
    fun() ->
      mnesia:write(
        #people{
          id = Index,
          name = Name,
          age = Age
        })
    end,
  {atomic, Results} = mnesia:transaction(Insert).


find_user(Id) ->
  Query =
    fun() ->
      mnesia:match_object({people, Id, '_', '_'})
    end,
  {atomic, Results} = mnesia:transaction(Query).


all() ->
  Query =
    fun() ->
      mnesia:match_object({people, '_', '_', '_'})
    end,
  {atomic, Results} = mnesia:transaction(Query).


bll() ->
  Query =
    fun() ->
      mnesia:match_object({table_id, '_', '_'})
    end,
  {atomic, Results} = mnesia:transaction(Query).
