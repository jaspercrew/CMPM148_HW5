VAR timeA = 9
VAR timeB = 1
VAR looped = 0
VAR testnum = 483
VAR fresh = false
VAR breakfast = false
VAR blood = false
VAR sit = 0
VAR armed = false
VAR snoozed = 0


->begin
==begin==
    ~ timeA = 9
    ~ timeB = 1
    ~ fresh = false
    ~ breakfast = false
    ~ blood = false
    ~ sit = 0
    ~ armed = false
    
    Time: 8:00 AM
    
    You wake up to the sound of a blaring alarm clock.
    {looped > 0: You feel as though something is off, but you can't put your finger on it.}
    
     + [Turn the alarm clock off and get out of bed]
        You turn off the alarm clock and get out of bed.
        ->nine
     + [Snooze]
        You hit the snooze button and return to bed.
        ~ snoozed += 1
        {snoozed > 5 && looped > 0: ->end3}
        ->begin
        
        
==nine==
    Time: {timeA}:00 AM
    
    + {timeA < 11 && fresh == false} [Freshen up]
        ~ fresh = true
        You go to the bathroom and get ready for the day ahead.
        ~ timeA += 1
        ->nine
    + {timeA < 11 && breakfast == false} [Have breakfast]
        You eat a bowl of bland {&corn puffs | rice crisps | porridge | stew}.
        ~ breakfast = true
        ~ timeA += 1
        ->nine
    + {timeA == 11} [Go to the living room]
        You head over to the living room.
        ->eleven
        
==eleven==
    Time: 11:00 AM
    You have a bit of free time before lunch. 
    {looped > 0: The living room seems more disheveled than usual.}
    + [Journal] 
        You write down some of your thoughts in your journal.
        
    + [Read a book]
        You sit down and read for an hour.
    + {looped > 0} [Organize the room]
        You start rearranging the room, cleaning up various clutter. You notice a splotch of blood in the corner of the room
        ++ [Investigate the blood]
            You walk over to the blood. Strangely, it seems familiar. You get the feeling that you should change up your daily schedule.
            ~ blood = true
        ++ [Ignore the blood]
            You decide to ignore the blood. It's probably left over from the previous tenant.
    - ->noon
        
==noon==
    Time: 12:00 PM
    It's your usual lunchtime.
    + [Eat Lunch]
        You make yourself a quick {&ham sandwich | cheese sandwich | turkey sandwich}.
    - ->onepm
    
==onepm
Time: {timeB}:00 PM
    + {timeB < 6} [Work]
        You work for an hour. {~Mind numbing as always. | Boring as always. | Still boring. | Always uninteresting. | Meaningless toil. | The words and numbers in front of you almost seem to lose meaning.}
        ~ timeB += 1
        ->onepm
    + {timeB < 6 && looped > 0 && blood == true} [Do Nothing]
        You sit around for an hour.
        ~ sit += 1
        ~ timeB += 1
        {sit < 4 : ->onepm}
        {sit >= 4: -> sataround}
    + {timeB >= 6} [Prepare for dinner]
        ->sevenpm
        
==sataround==
    Time: ????
    After sitting around for a while, you hear a loud noise coming from the back of your house.
    + [Investigate the sound]
        Time: ????
        You walk over to the back of your house. The back door is open.
        ++ [Hide]
            ->hiding
        ++ [Close the door]
            As you move to open the door, you feel a shocking pain in your chest. You look down and see a kitchen knife poking through your ribs, blood seeping out.
            ->end1
    +[Hide]
        ->hiding
    + [Keep doing nothing]
        You sit around doing nothing until 7 PM.
        -> sevenpm
==hiding==
    Time: ????
    You hide in a nearby closet. You hear the sound of footsteps pass by.
    + [Keep Hiding]
        You maintain your hiding spot. You no longer hear footsteps. You feel very tired.
        ++ [Keep Hiding]
            You decide to stay in the closet for even longer. You eventually end up falling asleep. 
            +++ [Move On]
                ->begin
        ++[Exit the Closet]
            ->exit
    + [Exit the Closet]
        ->exit

==exit==
    Time: ????
    You quietly exit the closet. 
    + [Return to living room]
        You go back to the living room. As you sit back down, you hear a strange robotic voice a few rooms over: "SUBJECT ALPHA RETURNED TO STANDARD PROTOCOL. QUITTING TERMINATION PROCESS". You know something is wrong.
        ++[Arm yourself]
            ->ready
        ++[Investigate the voice]
            As you walk over to investigate, you feel a shocking pain in your chest. You look down and see a kitchen knife poking through your ribs, blood seeping out.
            +++ [Move On]
                ->end1
            
            
==ready==
    Time: ????
    You go to the kitchen and grab a large cleaver.
    ~armed = true
        + [Investigate the voice]
            You move to the robotic voice. As you approach, you spot the source of the noise. It's your friend, standing still in the center of the room.
            ++[Greet your friend]  
                As you walk over to say hello, you feel a shocking pain in your chest. You look down and see a kitchen knife poking through your ribs, blood seeping out.
                ->end1
            ++[Attack your friend]
                ->fight
        + [Stay in the living room]
            You decide to stay in the living room. 
            ->sevenpm


        
    
==sevenpm==
    Time: 7:00 PM
    Your friend is coming over for dinner. You have a bit of time to prepare.
    + [Journal] 
        You write down some of your thoughts in your journal.
        
    + [Read a book]
        You sit down and read for an hour.
    
    + {armed == true} [Stay Alert]
        You maintain your readiness and prepare for a fight. 
    - ->eightpm
        
    
        
==fight==
    Time: ????
    Your friend strikes first, swinging a large kitchen knife at you.
    + [Block]
        You barely manage to parry their attack, but their strike knocks you to the ground. 
        ++ [Attack]
            As you're on the ground, you desperately swing your blade at them. They do the same. Both of you begin to bleed profusely.
            +++ [Move On]
                ->end2
    + [Attack]
        As you move to strike them, their blade finds your chest. You look down and see a kitchen knife poking through your ribs, blood seeping out.
        ->end1

==eightpm==
    Time: 8:00 PM
    Your friend seems to be late. They should be over any second now.
    + Turn on the TV
        As you pick up the remote, you feel a shocking pain in your chest. You look down and see a kitchen knife poking through your ribs, blood seeping out.
        ->end1
    + Sit down on the couch
        As you sit down, you feel a shocking pain in your chest. You look down and see a kitchen knife poking through your ribs, blood seeping out.
        ->end1
    + Make some food
        As you walk over to the kitchen, you feel a shocking pain in your chest. You look down and see a kitchen knife poking through your ribs, blood seeping out.
        ->end1
    + {armed == true} [Stay Alert]
        You maintain your readiness and prepare for a fight. After a few minutes, you hear the front door open. Your friend walks through and aggressively moves torwards you. 
        ->fight
    
==end1==
    Time: ????
    As you lay on the ground, bleeding out, you hear a robotic voice in the distance. "INTRAPERSONAL DATA COLLECTION COMPLETE. PRODUCTIVITY TEST ALPHA NUMBER {testnum} COMPLETE. PREPARE FOR RESET."  
    ~ testnum += 1
    ~ looped += 1
    ~ snoozed = 0
    + [Move On]
        ->begin
==end2==
    Time: ????
    Both of you lay on the ground, bleeding out. As you struggle to stay conscious, you hear a robotic voice in the distance. "INTRAPERSONAL DATA COLLECTION SUBJECT INVALID. PRODUCTIVITY TEST ALPHA NUMBER {testnum} FAILURE. NEW SUBJECT NEEDED." You feel your body being dragged away before you finally fall asleep. Eternal silence falls upon you. You can finally rest. 
    ->END

==end3==
    Time: ????
    SECRET ENDING: As you lay in bed, you hear a robotic voice in the distance: "INTRAPERSONAL DATA COLLECTION SUBJECT IS LAZY. PRODUCTIVITY TEST ALPHA NUMBER {testnum} FAILURE. PREPARE FOR RESET."
    ->END
