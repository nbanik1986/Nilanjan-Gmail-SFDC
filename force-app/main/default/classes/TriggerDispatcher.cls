public class TriggerDispatcher{

public static void run(TriggerInterface handler,system.TriggerOperation operationtype){

switch on operationtype{

WHEN BEFORE_INSERT{

handler.beforeInsert(Trigger.new);

}

When AFTER_INSERT{
handler.afterInsert(Trigger.new,trigger.newmap);

}

When BEFORE_UPDATE{

handler.beforeUpdate(trigger.oldmap,trigger.newmap);

}
When AFTER_UPDATE{

handler.afterUpdate(trigger.oldmap,trigger.newmap);
}

When BEFORE_DELETE{
}

When AFTER_DELETE{

}

When AFTER_UNDELETE{

}

}



}

}