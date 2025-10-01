Credit:
1. tutorial: https://docs.godotengine.org/en/stable/getting_started/step_by_step/index.html

2. adding audio help: https://www.youtube.com/watch?v=8RECF55sK_o

3. audio downloaded from: https://pixabay.com/sound-effects/vine-boom-392646/

4. source for rick and morty: https://www.nicepng.com/ourpic/u2q8o0q8q8e6a9r5_rick-and-morty-clipart-rick-head-rick-and/

5. https://www.mycutegraphics.com/graphics/hearts/red-heart.html

6. https://archive.org/details/tvtunes_27340

7. https://tuna.voicemod.net/sound/6740d628-4759-44f8-9c1c-789821573566

8. all background resources: https://www.denofgeek.com/tv/rick-and-morty-zoom-backgrounds/

https://www.dreamstime.com/portal-space-to-other-universes-portal-space-to-other-universes-isolated-black-background-vector-image252551834

9. https://www.deviantart.com/jonizaak/art/Get-Schwifty-A-Rick-and-Morty-font-638073728

10. https://www.voicy.network/sounds/e-W76469RkuqILfUo10Gqg-im-pickle-rick


9/7:
- following the written tutorial (starting at 10:00)
- working on the player, having a hard time understanding how scenes work
- done with player (10:57)
- starting on enemy (11:15)
- much easier now that I've done the player
- took me 10 minutes to figure out how to add a new scene
- done with enemy (12:26)
need a brain break
- starting main (2:00)
- super easy because the tutorial is just giving me the code to paste in
- very intently reading the tutorial so I can understand what's going on
- the coding part is easy, the more difficult thing to understand is the sprites and stuff, but I think that I just don't like how easy it is and how Godot has integrated a lot of stuff for me
- done with main (2:39)
- starting HUD (2:45)
- super easy, I'm really understanding this now!
- done! (3:18)

9/8:
adding lives mod (starting at 11:15)
- couldnt figure out how to update the message for the "lives" thing
- realized it was due to mislabeling (I was calling "LivesLabel" but it was actually called "Lives")
- finished the lives mod at 12:20

9/9: 
adding audio mod (starting at 1:00)
- fairly simple from following youtube tutorial (credit 2)
- downloaded boom sound (credit 3)
- finished mod at 1:10
customizing players (starting at 4:30)
- got files from online (credit 4)
- modified them so they would work with animations
- changed the message to say "ricks" instead of "creeps"
done! (7:00 with breaks in between)


----------------------------------------------------------------
part 2:

add levels:
- added text "level: 1" on screen & level variable in main (4:58-5:03)
- 11:29 trying to figure out how many enemies are generated in one round (going to limit and reduce for earlier rounds, gets harder as you go)
- 12:45 this is taking way too long, i have to think of another way to do this
- 1:00 thinking about implementing levels first and the velocity of the enemies are just going to take longer this time
- 2:09 I GIVE UP FOR THE NIGHT. idk why i cant figure out how to get these mobs off the screen. i may need an extension on this
-next day-
- 2:00 got help from Jonas to erase mobs on level up
- 2:55 he suggested i clean up some of my functions, so im working on that
- 3:00 working on end game 
- 3:26 done
-next day-
- 9:13 adding "collect hearts" feature
- 11:45 i can't get that to work. i give up. i'm changing my faucet to be that you just reset to 3 lives when you upgrade a level. i will try to add the extra hearts another time
done
-----------------------------------------------------
adding juice
- 1:56 customizing UI theme to fit rick and morty
- 2:19 found audios/backgrounds i want to use. theme song (background music) credit 6, "aw jeez" (collision sound) credit 7, garage background credit 8, and "get schwifty" font credit 9
- 4:00 done adding sounds
-break-
- 8:00 adding background, changing font, cleaning up HUD
- 8:45 making it so the background looks dark before the game starts and then lightens after start is pressed
- 9:15 making backgrounds change when levels change
- 10:00 
-----------------------------------------------------
level design
- 6:00 ideating about what to add to levels
- 6:30 going to have pickle ricks flying around for level 2 and if morty hits them, it adds to lives (art from credit 4)
- 6:33 editing art for animation
- 6:45 implememting pickles
- 7:15 trying to debug, wont run when trying to make pickles
- 7:30 ended up being that the wrong scene was attatched to the pickle file
- 7:36 pickles keep spawning in the same place, trying to fix it
- 8:15 realized its because i didnt draw the path
- 8:30 fixed it. now going to make the pickles spawn less frequently
- 9:30 finally got the timer to work, now starting making them detect collisions
- 11:00 godot crashed. lost a ton of progress. trying to fix before deadline, but pushing to github right now just in case
*giving myself an extra hour because i lost an hour due to the crash*
- 12:08 fixed godot. made it so pickles go away when u hit them
- 12:15 making it so pickles only come in for round 2 & 3
- adjusted levels to be harder (score must be higher to win)
- 12:20 adding pickle rick sound effect (credit 10)
- 12:30 adding portal gun (credit 4) to make ricks go away for a couple seconds
- 12:50 making portal gun have gravity, disapear when touched, boom sound when touched, and will make all ricks on screen go away. portal gun is exclusive to level 3
- 1:00 calling it quits. feels good!
