
/* "Copyright (c) 2000-2003 The Regents of the University of California.
 * All rights reserved.
 *
 * Permission to use, copy, modify, and distribute this software and its
 * documentation for any purpose, without fee, and without written agreement
 * is hereby granted, provided that the above copyright notice, the following
 * two paragraphs and the author appear in all copies of this software.
 *
 * IN NO EVENT SHALL THE UNIVERSITY OF CALIFORNIA BE LIABLE TO ANY PARTY FOR
 * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING OUT
 * OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF THE UNIVERSITY
 * OF CALIFORNIA HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * THE UNIVERSITY OF CALIFORNIA SPECIFICALLY DISCLAIMS ANY WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS
 * ON AN "AS IS" BASIS, AND THE UNIVERSITY OF CALIFORNIA HAS NO OBLIGATION TO
 * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS."
 */

/**
 * AlarmMilliC is the alarm for async millisecond alarms
 *
 * @author Cory Sharp <cssharp@eecs.berkeley.edu>
 * @see  Please refer to TEP 102 for more information about this component and its
 *          intended use.
 */
 
generic configuration AlarmMilli32C()
{
  provides interface Init;
  provides interface Alarm<TMilli,uint32_t>;
}
implementation
{
  components new Alarm32khz16C() as AlarmFrom;
  components new CounterMilli32C() as Counter;
  components new TransformAlarmC(TMilli,uint32_t,T32khz,uint16_t,5) as Transform;

  Init = AlarmFrom;
  Alarm = Transform;

  Transform.AlarmFrom -> AlarmFrom;
  Transform.Counter -> Counter;
}

