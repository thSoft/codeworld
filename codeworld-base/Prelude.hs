{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE PackageImports    #-}

--------------------------------------------------------------------------------
-- |The standard set of functions and variables available to all programs.
--
-- You may use any of these functions and variables without defining them.
module Prelude (
    -- $intro

    -- * Numbers
    module Internal.Num,

    -- * Text
    module Internal.Text,

    -- * General purpose functions
    module Internal.Prelude,

    -- * Colors
    Color(..),
    black,
    white,
    red,
    green,
    blue,
    cyan,
    magenta,
    yellow,
    aquamarine,
    orange,
    azure,
    violet,
    chartreuse,
    rose,
    brown,
    pink,
    purple,
    gray,
    grey,
    light,
    dark,
    muted,
    translucent,

    -- * Pictures
    Point,
    Vector,
    addVectors,
    scaleVector,
    rotateVector,
    Picture,
    blank,
    line,
    polygon,
    thickLine,
    rectangle,
    solidRectangle,
    thickRectangle,
    circle,
    solidCircle,
    thickCircle,
    arc,
    sector,
    thickArc,
    text,
    color,
    translate,
    scale,
    rotate,
    pictures,
    (&),

    -- * Events
    Event(..),

    -- * Entry points
    IO,
    Program,
    pictureOf,
    animationOf,
    simulationOf,
    interactionOf
    ) where

import "base" Prelude (IO)

import Internal.Num
import Internal.Prelude
import Internal.Text

import Internal.Color
import Internal.Picture
import Internal.Event
import Internal.CodeWorld

--------------------------------------------------------------------------------
-- $intro
-- Welome to CodeWorld!  You can define your own pictures, animations, and games
-- by defining variables and functions.  There are four kinds of CodeWorld
-- programs:
--
-- * Pictures.  To create a picture, you'll define the variable called @main@
--   using 'pictureOf'.  The parameter to 'pictureOf' should be a 'Picture'.
--   Example:
--
-- > main = pictureOf tree
--
-- * Animations.  To create an animation, you'll define the variable called
--   @main@ using 'animationOf'.  The parameter to 'animationOf' should be a
--   function, mapping each time in seconds (a 'Number') to a 'Picture' that is
--   shown at that time.  Example:
--
-- > main = animationOf spinningWheel
--
-- * Simulations.  A simulation is like an animation, in that it changes over
--   time.  But while an animation changes in a simple regular way over time, a
--   simulation can change in different ways depending on the state of things
--   at any moment.  To create a simulation, you should first decide on the
--   type to describe the state of things (called the "world" type), and
--   describe the simulation in terms of the starting state, the step that
--   says how things change over time, and and a draw function that can build
--   a picture from a state.  Then you'll use 'simulationOf' to define main.
--   Example:
--
-- > main = simulationOf start step draw
--
-- * Interactions.  Finally, you can build an interactive simulation, such as
--   a game.  This is very like a simulation, except that it also has an event
--   function, which says how the state of things changes when events (like
--   keys being pressed or the mouse moving) happen.  You'll use
--   'interactionOf' to define these.  Example:
--
-- > main = interactionOf start step event draw